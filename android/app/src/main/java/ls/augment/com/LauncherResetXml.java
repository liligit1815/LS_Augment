package ls.augment.com;

import java.io.IOException;
import java.io.StringReader;
import java.nio.ByteBuffer;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.StandardCharsets;
import java.util.HashSet;
import java.util.Set;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;
import org.xml.sax.ErrorHandler;
import org.xml.sax.InputSource;

/** Strict Android SharedPreferences XML, independent of attribute order/quotes. */
final class LauncherResetXml {
    private LauncherResetXml() { }
    static State read(byte[] bytes, boolean grid) throws IOException {
        try {
            String xml=StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
                    .onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(bytes)).toString();
            // Preference records have no DTD. Reject it before any parser can
            // expand external/internal entities, including on the Android parser.
            if(xml.contains("<!DOCTYPE")||xml.contains("<!ENTITY"))throw new IOException("桌面模块记录包含外部声明");
            var factory=DocumentBuilderFactory.newInstance();factory.setExpandEntityReferences(false);
            var builder=factory.newDocumentBuilder();
            builder.setEntityResolver((publicId,systemId)->{throw new SAXException("不支持外部实体");});
            builder.setErrorHandler(new ErrorHandler(){
                public void warning(SAXParseException e)throws SAXException{throw e;}
                public void error(SAXParseException e)throws SAXException{throw e;}
                public void fatalError(SAXParseException e)throws SAXException{throw e;}
            });
            // Parse exactly the validated UTF-8 characters. An XML declaration
            // cannot switch the parser to a different byte encoding afterwards.
            Element root=builder.parse(new InputSource(new StringReader(xml))).getDocumentElement();
            if(!"map".equals(root.getTagName())||root.getAttributes().getLength()!=0)throw new IOException("桌面模块记录根节点无效");
            Set<String> keys=new HashSet<>();boolean pending=false;
            for(Node node=root.getFirstChild();node!=null;node=node.getNextSibling()){
                if(node.getNodeType()==Node.COMMENT_NODE||whitespace(node))continue;
                if(!(node instanceof Element entry))throw new IOException("桌面模块记录节点无效");
                String name=entry.getAttribute("name"),tag=entry.getTagName();
                if(name.isEmpty()||!keys.add(name))throw new IOException("桌面模块记录键重复或缺失");
                validate(entry);
                if(grid)switch(name){
                    case "owned", "migration_pending":
                        if(!"boolean".equals(tag))throw new IOException("桌面行列恢复标记类型无效");
                        pending|="true".equals(entry.getAttribute("value"));break;
                    case "original_rows", "original_columns", "effective_rows", "effective_columns":
                        if(!"int".equals(tag)||Integer.parseInt(entry.getAttribute("value"))<=0)throw new IOException("桌面行列恢复尺寸无效");
                        pending|=name.startsWith("original_");break;
                    default:throw new IOException("桌面行列记录包含未识别的恢复字段");
                }
            }
            return new State(pending,!keys.isEmpty());
        }catch(CharacterCodingException invalid){throw new IOException("桌面模块记录编码损坏，保留恢复依据",invalid);}
        catch(IOException invalid){throw invalid;}
        catch(Exception invalid){throw new IOException("桌面模块记录损坏，保留恢复依据",invalid);}
    }
    private static void validate(Element entry)throws IOException{
        String tag=entry.getTagName(),value=entry.getAttribute("value");int count=entry.getAttributes().getLength();
        switch(tag){
            case "boolean":
                if(count!=2||!entry.hasAttribute("value")||!(value.equals("true")||value.equals("false")))throw new IOException("桌面模块布尔值无效");
                empty(entry);break;
            case "int":case "long":case "float":
                if(count!=2||!entry.hasAttribute("value"))throw new IOException("桌面模块数值属性无效");
                try{if(tag.equals("int"))Integer.parseInt(value);else if(tag.equals("long"))Long.parseLong(value);
                    else if(!Float.isFinite(Float.parseFloat(value)))throw new NumberFormatException();
                }catch(NumberFormatException invalid){throw new IOException("桌面模块数值无效",invalid);}
                empty(entry);break;
            case "string":
                if(count!=1)throw new IOException("桌面模块字符串属性无效");textOnly(entry);break;
            case "set":
                if(count!=1)throw new IOException("桌面模块名单属性无效");
                for(Node child=entry.getFirstChild();child!=null;child=child.getNextSibling()){
                    if(whitespace(child))continue;
                    if(!(child instanceof Element item)||!"string".equals(item.getTagName())||item.getAttributes().getLength()!=0)throw new IOException("桌面模块名单内容无效");
                    textOnly(item);
                }break;
            default:throw new IOException("桌面模块记录类型未识别");
        }
    }
    private static void empty(Element entry)throws IOException{
        for(Node child=entry.getFirstChild();child!=null;child=child.getNextSibling())if(!whitespace(child))throw new IOException("桌面模块数值包含嵌套内容");
    }
    private static void textOnly(Element entry)throws IOException{
        for(Node child=entry.getFirstChild();child!=null;child=child.getNextSibling())
            if(child.getNodeType()!=Node.TEXT_NODE&&child.getNodeType()!=Node.CDATA_SECTION_NODE)throw new IOException("桌面模块字符串嵌套内容无效");
    }
    private static boolean whitespace(Node node){return node.getNodeType()==Node.TEXT_NODE&&node.getTextContent().trim().isEmpty();}
    static final class State{
        final boolean pendingGridRestore,historyPresent;
        State(boolean pending,boolean history){pendingGridRestore=pending;historyPresent=history;}
    }
}
