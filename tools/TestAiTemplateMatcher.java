package ls.augment.com.hook;

import java.awt.image.BufferedImage;
import java.io.File;
import javax.imageio.ImageIO;

public final class TestAiTemplateMatcher {
    public static void main(String[] args) throws Throwable {
        BufferedImage template = card(false);
        verify(template, frame(template), true, "symbol present");
        verify(template, frame(card(true)), false, "same card with symbol missing");
        verify(template, new BufferedImage(517, 581, BufferedImage.TYPE_INT_RGB), false, "empty screen");
        if (args.length == 5) {
            BufferedImage nativeTemplate = ImageIO.read(new File(args[0]));
            for (int i = 1; i < args.length; i++) {
                BufferedImage screenshot = ImageIO.read(new File(args[i]));
                verify(nativeTemplate, screenshot.getSubimage(438, 311, 517, 581), i == 1,
                        "actual phone screenshot " + new File(args[i]).getParentFile().getName());
            }
        }
        System.out.println("PASS TestAiTemplateMatcher");
    }

    private static void verify(BufferedImage template, BufferedImage screen, boolean expected, String label)
            throws Throwable {
        int step = AiTemplatePixels.samplingStep(screen.getHeight(), screen.getWidth(),
                template.getHeight(), template.getWidth());
        AiTemplatePixels sample = AiTemplatePixels.read(new ImageMat(template), step);
        AiTemplatePixels frame = AiTemplatePixels.read(new ImageMat(screen), step);
        int result = AiTemplateMatcher.match(frame, sample, sample.foregroundAnchors(96), 96 / step, 128 / step);
        if ((result != AiTemplateMatcher.NONE) != expected) {
            throw new AssertionError(label + " expected=" + expected + " result=" + result);
        }
        System.out.println("PASS " + label + " result=" + result + " step=" + step);
    }

    private static BufferedImage card(boolean blank) {
        BufferedImage image = new BufferedImage(325, 325, BufferedImage.TYPE_INT_RGB);
        for (int y = 0; y < 325; y++) for (int x = 0; x < 325; x++) {
            boolean symbol = !blank && y >= 125 && y < 224
                    && ((x >= 65 && x < 80) || (x >= 170 && x < 185)
                    || (y >= 170 && y < 185 && x >= 65 && x < 185));
            image.setRGB(x, y, symbol ? 0xffffff : y < 50 || y >= 275 ? 0xedf4ff : 0x126cc5);
        }
        return image;
    }

    private static BufferedImage frame(BufferedImage card) {
        BufferedImage image = new BufferedImage(517, 581, BufferedImage.TYPE_INT_RGB);
        for (int y = 0; y < 581; y++) for (int x = 0; x < 517; x++) image.setRGB(x, y, 0xedf4ff);
        for (int y = 0; y < 325; y++) for (int x = 0; x < 325; x++) image.setRGB(x + 96, y + 128, card.getRGB(x, y));
        return image;
    }

    public static final class ImageMat {
        private final BufferedImage image;
        public ImageMat(BufferedImage image) { this.image = image; }
        public int rows() { return image.getHeight(); }
        public int cols() { return image.getWidth(); }
        public int channels() { return 3; }
        public int get(int row, int col, byte[] bytes) {
            int start = row * cols() + col;
            for (int i = 0; i < bytes.length / 3; i++) {
                int pixel = start + i;
                int rgb = image.getRGB(pixel % cols(), pixel / cols());
                bytes[i * 3] = (byte) rgb;
                bytes[i * 3 + 1] = (byte) (rgb >>> 8);
                bytes[i * 3 + 2] = (byte) (rgb >>> 16);
            }
            return bytes.length;
        }
    }
}
