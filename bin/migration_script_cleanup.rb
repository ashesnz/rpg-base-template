class Main
  @sql_file_path = nil
  
  def initialize
    @sql_file_path = ARGV[0]
  end

  def run
    write_file process_file @sql_file_path if @sql_file_path
  end

  def process_file(file_path)
    schema_migration_text_excluded = false
    line_array = []
    output_array = []

    File.open(file_path, 'r') do |file|
      file.each_line do |line|
        line_array << line
      end
    end

    line_array.each_with_index do |line, index|
      if schema_migration_text_excluded
        output_array << clean_line(line) unless line.include? 'schema_migrations'
      end

      unless line_array[index + 1].nil?
        if line_array[index + 1].include? 'Begin applying migration'
          schema_migration_text_excluded = true
        end
      end
    end

    output_array
  end

  def clean_line(line)
    # REMOVE: I, [2019-04-10T03:42:47.740643 #10]  INFO -- : 
    line = line.sub(/^I, \[\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}.\d{6} #\d{2}\]  INFO -- : /, '')
    if line.start_with? "("
      # ADD ; before new line \n
      pos = line.index("\n")
      line = line.insert(pos, ';')
    else 
      # Comment out descriptive text
      line = "-- #{line}"
    end
    # REMOVE: (N.NNNNNNs) time blurb from remaining lines
    line = line.sub(/^\(\d.\d{6}s\) /, '')
  end

  def write_file(data)
    # output_path = '/home/wamci0/rpg/rpg-base-template/sql/test.sql'
    File.open(@sql_file_path, 'w') do |file| 
      data.each do |line|
        file.write(line)
      end
    end
  end
end

Main.new.run
