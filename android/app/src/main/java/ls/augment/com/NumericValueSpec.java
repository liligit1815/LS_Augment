package ls.augment.com;

import java.math.BigDecimal;

/** Decimal arithmetic shared by slider mappings and exact entry; never silently rounds input. */
final class NumericValueSpec {
    final BigDecimal minimum, maximum, step;
    final String unit;

    NumericValueSpec(double minimum, double maximum, double step, String unit) {
        this.minimum = BigDecimal.valueOf(minimum);
        this.maximum = BigDecimal.valueOf(maximum);
        this.step = BigDecimal.valueOf(step);
        this.unit = unit == null ? "" : unit;
        if (this.minimum.compareTo(this.maximum) > 0 || this.step.signum() <= 0)
            throw new IllegalArgumentException("Invalid numeric range");
    }

    String normalize(String input) {
        if (input == null || !input.trim().matches("[+-]?(?:[0-9]+(?:\\.[0-9]*)?|\\.[0-9]+)")) return null;
        try {
            BigDecimal value = new BigDecimal(input.trim());
            if (value.compareTo(minimum) < 0 || value.compareTo(maximum) > 0
                    || value.subtract(minimum).remainder(step).signum() != 0) return null;
            return format(value);
        } catch (NumberFormatException | ArithmeticException invalid) { return null; }
    }

    String description() {
        return "范围：" + format(minimum) + "–" + format(maximum) + unit + "；步长：" + format(step) + unit;
    }

    static String format(BigDecimal value) { return value.stripTrailingZeros().toPlainString(); }
    static String valueAt(int progress, double offset, double step) {
        return format(BigDecimal.valueOf(offset).add(BigDecimal.valueOf(step).multiply(BigDecimal.valueOf(progress))));
    }
    static int progressOf(String value, double offset, double step) {
        return new BigDecimal(value).subtract(BigDecimal.valueOf(offset)).divide(BigDecimal.valueOf(step)).intValueExact();
    }
}
