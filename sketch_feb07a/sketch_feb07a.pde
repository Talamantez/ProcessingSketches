createSocket ();

function createSocket () {
	_root.createTextField("inputlabel",4,50,100,50,20);
	inputlabel.text = "Input:";
	_root.createTextField("outputlabel",5,50,300,50,20);
	outputlabel.text = "Output:";
	_root.createTextField("inputer",3,100,100,200,20);
	_root.createTextField("outputer",2,100,300,200,20);
	outputer.type = "input";
	outputer.border = true;
	inputer.border = true;
	serialServer = new XMLSocket ();
	trace ("made it" + serialServer);
	//127.0.0.1 is the same as "localhost" ie an alias to your local machine
	//it is concievable to that you would want to connect from another machine and you would change this
	serialServer.connect ("127.0.0.1", 9001);
	serialServer.onConnect = function (success) {
		trace ("connected " + success);
		serialServer.send ("HOWDY FROM FLASH" + new Date().toString());
	};
	serialServer.onClose = function () {
		trace ("closed");
	};
	serialServer.onData = function (data) {
		trace ("incoming" + data);
		inputer.text = inputer.text + data;
	};
	outputer.onChanged = function () {
		serialServer.send (outputer.text);
		trace ("output" + outputer.text);
		outputer.text = "";
	};
}
