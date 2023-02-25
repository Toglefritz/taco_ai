# Trivial Algorithmic Comprehension and Output (TACO)

TACO is a very, very rudimentary text prediction system. It is designed to illustrate the general principles under which today's most popular text prediction AI systems operate. That is to say that, although systems like GPT-3, ChatGPT, and BART use much more sophisticated algorithms, both TACO and these fancier options work by ingesting training data, building a model from that data, and using the model to predict the most likely next word to follow a prompt. 


⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⢀⣤⣀⠀⠀⢀⣴⢶⣄⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⠀⠀⣠⡾⠛⢷⣄⣿⠁⠉⠻⠾⠛⠁⠀⠙⢛⣛⠻⣧⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠉⠉⠛⠛⠋⠀⢀⣀⣉⢀⣠⣤⣴⠛⠲⣤⡖⠋⠉⠈⠙⣦⣦⣿⣇⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡴⠟⠀⠀⣀⣀⣀⣴⣋⡀⠉⠉⠀⠀⣹⡶⢟⠛⠛⡛⢶⣄⣠⣿⣇⡀⠈⠙⡷⣆⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠟⢻⣤⣤⡶⠟⠛⠛⡙⠛⢻⣿⣿⣶⣤⣾⣯⣤⠾⠷⠶⠷⠶⠿⠿⣯⣬⣻⣦⣼⡷⠟⢻⡆⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣴⠾⠃⢀⣴⠟⠉⠀⠰⠄⢀⡧⠤⣞⣠⡾⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⢷⣄⡀⠘⣷⡀⠀
⠀⠀⠀⠀⠀⠀⣿⠁⠀⢀⣿⠏⠀⠀⠃⣠⣴⣾⣦⡾⠋⠁⠀⠀⠀⠀⠀⠀⣠⡤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣦⠉⢿⡆
⠀⠀⠀⠀⣠⡾⠋⠀⠀⣸⣿⡀⠘⠃⠸⢿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⠷⠀⠀⠀⠀⠀⣾⡃⠀⠀⠀⠀⠀⠙⣧⠙⣷
⠀⠀⠀⠀⣿⠀⠀⠀⠀⣻⣿⣿⣿⣷⣿⡿⠋⠀⠀⠀⠀⠀⢀⣶⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠋⠀⠀⠀⠀⠀⠀⠸⣿⠋
⠀⠀⠀⠀⣼⠷⢶⣴⡾⠿⣿⡏⠀⣴⠏⠀⠀⠀⣤⠀⠀⠀⠈⠻⠆⠀⠀⠀⠀⠀⢸⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⠀
⠀⠀⠀⣸⠏⣰⡿⠋⢦⣠⡼⢇⣼⠃⠀⠀⠀⠀⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠂⠀⠀⠀⠀⣼⠀
⠀⠀⣰⠏⣰⡟⠀⠠⢀⣯⣀⣾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠙⠁⠀⠀⠀⢠⡟⠀
⠀⢠⣟⣠⣿⠀⠰⠀⣿⣿⣿⠃⠀⠀⠀⠀⠀⣼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⠆⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⡴⠾⠋⠀⠀
⠀⣾⣹⠉⣿⣦⣤⠴⠒⣿⠃⠀⠀⠀⠀⠀⠀⠻⠖⠀⠀⠀⠀⣷⡀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⡴⠶⠛⠋⠉⠀⠀⠀⠀⠀⠀
⢰⡟⣏⠀⢻⣟⠁⣀⣼⠇⠀⠀⢀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⡴⠶⠛⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣾⢷⡋⠇⠈⢿⣦⣰⠏⠀⠀⠀⠘⠧⠀⠀⠀⠀⠀⢀⣀⣠⣤⠶⠞⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⢸⣇⠸⢢⠀⣹⡟⠀⠀⠀⠀⠀⢀⣀⣤⡴⠶⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢻⣟⢘⡆⢈⣴⠏⢀⣀⣤⡴⠶⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠙⠷⠶⠿⠷⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀