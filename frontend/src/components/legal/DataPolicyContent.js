'use client';
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var markdown_to_jsx_1 = require("markdown-to-jsx");
function DataPolicyContent(_a) {
    var data = _a.data;
    // Convert blocks to markdown string
    var convertBlocksToMarkdown = function (blocks) {
        if (!blocks)
            return '';
        return blocks.map(function (block) {
            var text = block.children.map(function (child) {
                if (child.type === 'link') {
                    return "[".concat(child.text, "](").concat(child.url, ")");
                }
                if (child.bold) {
                    return "**".concat(child.text, "**");
                }
                return child.text;
            }).join('');
            switch (block.type) {
                case 'heading-1':
                    return "# ".concat(text, "\n\n");
                case 'heading-2':
                    return "## ".concat(text, "\n\n");
                case 'heading-3':
                    return "### ".concat(text, "\n\n");
                case 'paragraph':
                    return "".concat(text, "\n\n");
                case 'thematic-break':
                    return '---\n\n';
                default:
                    return text + '\n\n';
            }
        }).join('');
    };
    var markdownContent = convertBlocksToMarkdown(data.data_policy);
    return (<article className="max-w-3xl mx-auto py-24 px-4 sm:px-6 lg:px-8">
      <div className="prose prose-tuscher max-w-none">
        <markdown_to_jsx_1.default options={{
            wrapper: 'div',
            forceWrapper: true,
            forceBlock: true,
            overrides: {
                h1: { props: { className: 'text-3xl font-bold mb-6' } },
                h2: { props: { className: 'text-2xl font-bold mb-4 mt-8' } },
                h3: { props: { className: 'text-xl font-bold mb-3 mt-6' } },
                p: { props: { className: 'mb-4 leading-relaxed' } },
                a: { props: { className: 'text-blue-600 hover:underline' } },
            },
        }}>
          {markdownContent}
        </markdown_to_jsx_1.default>
      </div>
    </article>);
}
exports.default = DataPolicyContent;
