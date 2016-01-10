" Load ruby source library

function! PoJoJoJo()
ruby << SCRIPT

    # requires pojojojo gem to be installed
    require 'pojojojo'

    buff = VIM::Buffer.current

    input = []

    buff.length.times { |l| input << buff[l + 1].split(' ') }

    lines = PoJo::JoJo.new(File.basename(buff.name, '.java')).pojoize(input)

    # clear input
    buff.length.times { |l| buff.delete(1) }

    lines.each_index { |i| buff.append(i, lines[i]) }

    # delete extra line
    buff.delete(buff.length)

SCRIPT
endfunction
