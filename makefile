cc_version    = c++20
debug_options = -std=$(cc_version) -Wall --pedantic-errors
debug_bin_dir = bin/debug
release_options = -std=$(cc_version) -O3
release_bin_dir = bin/release

release: $(release_bin_dir)/word_card.o $(release_bin_dir)/operate_xml.o $(release_bin_dir)/dictionary.o
	clang++ -o $(release_bin_dir)/word_card src/main.cc $^ $(release_options)

$(release_bin_dir)/word_card.o: src/word_card.cc src/word_card.h
	mkdir -p bin
	mkdir -p $(release_bin_dir)
	clang++ -c -o $@ src/word_card.cc $(release_options)

$(release_bin_dir)/dictionary.o: src/dictionary.cc src/dictionary.h
	clang++ -c -o $@ src/dictionary.cc $(release_options)

$(release_bin_dir)/operate_xml.o: src/operate_xml.cc src/operate_xml.h
	clang++ -c -o $@ src/operate_xml.cc $(release_options)

run:
	./$(release_bin_dir)/word_card

clean:
	rm $(release_bin_dir)/*


debug: $(debug_bin_dir)/debug_word_card.o $(debug_bin_dir)/debug_operate_xml.o $(debug_bin_dir)/debug_dictionary.o
	clang++ -o $(debug_bin_dir)/$@ src/main.cc $(debug_options) $^

$(debug_bin_dir)/debug_word_card.o: src/word_card.cc src/word_card.h
	mkdir -p bin
	mkdir -p $(debug_bin_dir)
	clang++ -c -o $@ src/word_card.cc $(debug_options)

$(debug_bin_dir)/debug_dictionary.o: src/dictionary.cc src/dictionary.h
	clang++ -c -o $@ src/dictionary.cc $(debug_options)

$(debug_bin_dir)/debug_operate_xml.o: src/operate_xml.cc src/operate_xml.h
	clang++ -c -o $@ src/operate_xml.cc $(debug_options)

debug_run:
	./$(debug_bin_dir)/debug

debug_clean:
	rm $(debug_bin_dir)/*
