var e = example.ReturnValue({_value : 3})
e.watch(function(error, result) {
  if(error) {
	console.log(error);
	return;
  }
  console.log("Got returnvalue:")
  console.log(result.args._from);
  console.log(result.args._value);
});

example.foo.sendTransaction(1, {from:myAccount})

// should show, after some time:
// Got returnvalue:
// you address
// 1
