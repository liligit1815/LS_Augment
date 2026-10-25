package ls.augment.com;

import android.graphics.Matrix;
import android.os.Parcel;
import android.view.InputDevice;
import android.view.KeyEvent;
import android.view.MotionEvent;
import org.json.JSONObject;

/** Device-only regression for the full event format; performs no privileged input injection. */
final class AtomicWorkbenchInputDeviceCases {
    private AtomicWorkbenchInputDeviceCases() { }

    static JSONObject run() throws Exception {
        MotionEvent.PointerProperties[] properties = {
                property(7, MotionEvent.TOOL_TYPE_FINGER),
                property(19, MotionEvent.TOOL_TYPE_STYLUS)
        };
        MotionEvent source = MotionEvent.obtain(100L, 110L, MotionEvent.ACTION_MOVE, 2,
                properties, new MotionEvent.PointerCoords[] {
                        coordinate(20f, 30f, .4f), coordinate(100f, 60f, .7f)
                }, KeyEvent.META_SHIFT_ON, 0, 1f, 1f, 42, 0,
                InputDevice.SOURCE_TOUCHSCREEN, 0);
        MotionEvent mapped = null, decoded = null, pointerUp = null;
        try {
            source.addBatch(120L, new MotionEvent.PointerCoords[] {
                    coordinate(30f, 40f, .3f), coordinate(110f, 70f, .8f)
            }, KeyEvent.META_SHIFT_ON);
            mapped = MotionEvent.obtain(source);
            Matrix matrix = new Matrix();
            matrix.setValues(AtomicWorkbenchInputPolicy.Geometry.create(
                    10, 20, 200, 100, 1001, 501, 1).matrixValues());
            mapped.transform(matrix);
            decoded = roundTrip(mapped);
            require(decoded.getPointerCount() == 2, "pointer count");
            require(decoded.getPointerId(0) == 7 && decoded.getPointerId(1) == 19, "pointer IDs");
            require(decoded.getToolType(1) == MotionEvent.TOOL_TYPE_STYLUS, "tool type");
            require(decoded.getDownTime() == 100L && decoded.getEventTime() == 120L, "event times");
            require(decoded.getDeviceId() == 42 && decoded.getMetaState() == KeyEvent.META_SHIFT_ON,
                    "device and modifiers");
            require(decoded.getSource() == InputDevice.SOURCE_TOUCHSCREEN, "source");
            close(decoded.getX(0), 200f, "first pointer x");
            close(decoded.getY(0), 450f, "first pointer y");
            close(decoded.getX(1), 500f, "second pointer x");
            close(decoded.getY(1), 250f, "second pointer y");
            close(decoded.getPressure(0), .3f, "first pressure");
            close(decoded.getPressure(1), .8f, "second pressure");
            require(decoded.getHistorySize() == 1, "history retained");
            require(decoded.getHistoricalEventTime(0) == 110L, "history time");
            close(decoded.getHistoricalX(0, 0), 100f, "history transformed x");
            close(decoded.getHistoricalY(0, 0), 475f, "history transformed y");
            close(source.getX(0), 30f, "caller event unchanged");
            close(source.getY(1), 70f, "caller second pointer unchanged");
            mapped.setAction(MotionEvent.ACTION_POINTER_UP | (1 << MotionEvent.ACTION_POINTER_INDEX_SHIFT));
            pointerUp = roundTrip(mapped);
            require(pointerUp.getActionMasked() == MotionEvent.ACTION_POINTER_UP
                    && pointerUp.getActionIndex() == 1 && pointerUp.getPointerId(1) == 19,
                    "pointer action index retained");
            return new JSONObject().put("success", true).put("pointerCount", 2)
                    .put("historySize", decoded.getHistorySize())
                    .put("pointerIdsPreserved", true).put("actionIndexPreserved", true)
                    .put("callerEventUnchanged", true);
        } finally {
            if (pointerUp != null) pointerUp.recycle();
            if (decoded != null) decoded.recycle();
            if (mapped != null) mapped.recycle();
            source.recycle();
        }
    }

    private static MotionEvent roundTrip(MotionEvent event) {
        Parcel parcel = Parcel.obtain();
        try {
            parcel.writeTypedObject(event, 0);
            parcel.setDataPosition(0);
            return parcel.readTypedObject(MotionEvent.CREATOR);
        } finally { parcel.recycle(); }
    }

    private static MotionEvent.PointerProperties property(int id, int type) {
        MotionEvent.PointerProperties property = new MotionEvent.PointerProperties();
        property.id = id;
        property.toolType = type;
        return property;
    }

    private static MotionEvent.PointerCoords coordinate(float x, float y, float pressure) {
        MotionEvent.PointerCoords coordinate = new MotionEvent.PointerCoords();
        coordinate.x = x;
        coordinate.y = y;
        coordinate.pressure = pressure;
        coordinate.size = .2f;
        return coordinate;
    }

    private static void close(float actual, float expected, String detail) {
        require(Math.abs(actual - expected) < .01f, detail + ": " + actual);
    }

    private static void require(boolean condition, String detail) {
        if (!condition) throw new AssertionError("Atomic input: " + detail);
    }
}
