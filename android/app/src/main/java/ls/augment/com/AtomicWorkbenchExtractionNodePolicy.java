package ls.augment.com;

/** Point selection is distinct from OCR or a whole-page transcript. Raw whitespace is retained. */
final class AtomicWorkbenchExtractionNodePolicy {
    private AtomicWorkbenchExtractionNodePolicy() { }
    static final class Metadata {
        final String pkg, className;
        final int window, left, top, right, bottom, depth, order, inputType, children;
        final boolean visible, password, sensitive, editable, web;
        Metadata(String pkg,String cls,int window,int l,int t,int r,int b,int depth,int order,int inputType,int children,
                boolean visible,boolean password,boolean sensitive,boolean editable,boolean web) {
            this.pkg=pkg;className=cls;this.window=window;left=l;top=t;right=r;bottom=b;this.depth=depth;this.order=order;
            this.inputType=inputType;this.children=children;this.visible=visible;this.password=password;this.sensitive=sensitive;this.editable=editable;this.web=web;
        }
        boolean contains(float x,float y) { return right>left&&bottom>top&&x>=left&&x<right&&y>=top&&y<bottom; }
        boolean protectedNode() { return password||sensitive||AtomicWorkbenchExtractionPolicy.password(inputType); }
        boolean textualContainer() {
            String c=className==null?"":className;
            return editable||children==0||c.endsWith("TextView")||c.endsWith("EditText");
        }
    }
    static final class Candidate {
        final Metadata metadata;
        final AtomicWorkbenchExtractionResult.Kind kind;
        final String text;
        Candidate(Metadata m,AtomicWorkbenchExtractionResult.Kind kind,String text) { metadata=m;this.kind=kind;this.text=text; }
    }
    static Candidate select(Candidate a,Candidate b) {
        if(a==null)return b;if(b==null)return a;
        // Actual text wins over a description; a deeper node wins over aggregate ancestor labels.
        if(a.kind!=b.kind)return b.kind==AtomicWorkbenchExtractionResult.Kind.NODE_TEXT?b:a;
        if(a.metadata.depth!=b.metadata.depth)return b.metadata.depth>a.metadata.depth?b:a;
        long aa=area(a.metadata),ba=area(b.metadata);
        if(aa!=ba)return ba<aa?b:a;
        return b.metadata.order<a.metadata.order?b:a;
    }
    private static long area(Metadata m) { return ((long)m.right-m.left)*((long)m.bottom-m.top); }
}
