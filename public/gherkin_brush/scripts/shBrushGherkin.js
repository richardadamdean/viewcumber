SyntaxHighlighter.brushes.Gherkin = function()
{
	var keywords   = 'Background Scenario Examples Outline Feature Given When Then And But';

	this.regexList = [
	{ regex: SyntaxHighlighter.regexLib.singleLinePerlComments,			css: 'comments' },
	{ regex: /@.*$/gmi,						  							css: 'comments' },
	{ regex: /Feature:/gmi,												css: 'keyword' },
	{ regex: new RegExp(this.getKeywords(keywords), 'gm'),				css: 'variable' },
	{ regex: /Scenario:/gmi,											css: 'keyword' },
	{ regex: /In order to/gmi,										css: 'variable' },
	{ regex: /As an?/gmi,					  							css: 'variable' },
	
	{ regex: /I want to/gmi,											css: 'variable' },
	{ regex: /I wish to/gmi,											css: 'variable' },
	{ regex: /So that/gmi,												css: 'variable' }
		];
};
SyntaxHighlighter.brushes.Gherkin.prototype = new SyntaxHighlighter.Highlighter();
SyntaxHighlighter.brushes.Gherkin.aliases    = ['gherkin', 'ghrkn'];
