from IPython import embed

def read_file(fname):
    with open(fname) as f:
        content = f.readlines()
    # you may also want to remove whitespace characters like `\n` at the end of each line
    lines = [x.strip() for x in content]
    return lines

def get_function(lines, func_name):
    func = list(filter(lambda x: x.find(func_name) == 0, lines))
    embed()
    if not func:
        return ""
    return func[0].replace(" -> DMessage;", "").replace(" -> Message;", "").replace("Message;", "").replace(":", "").replace(" -> ", " ")