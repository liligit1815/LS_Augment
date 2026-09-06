.class Lcom/android/launcher3/taskbar/TaskbarDragLayer$a;
.super Landroid/util/FloatProperty;
.source "TaskbarDragLayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/TaskbarDragLayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/FloatProperty<",
        "Lcom/android/launcher3/taskbar/TaskbarDragLayer;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/util/FloatProperty;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/taskbar/TaskbarDragLayer;)Ljava/lang/Float;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->e(Lcom/android/launcher3/taskbar/TaskbarDragLayer;)Lcom/android/launcher3/taskbar/L1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/L1;->e()Landroid/graphics/Paint;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroid/graphics/Paint;->getAlpha()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    int-to-float p0, p0

    .line 14
    const/high16 p1, 0x437f0000    # 255.0f

    .line 15
    .line 16
    div-float/2addr p0, p1

    .line 17
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public b(Lcom/android/launcher3/taskbar/TaskbarDragLayer;F)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->e(Lcom/android/launcher3/taskbar/TaskbarDragLayer;)Lcom/android/launcher3/taskbar/L1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/L1;->e()Landroid/graphics/Paint;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/high16 v0, 0x437f0000    # 255.0f

    .line 10
    .line 11
    mul-float/2addr p2, v0

    .line 12
    float-to-int p2, p2

    .line 13
    invoke-virtual {p0, p2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->invalidate()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarDragLayer$a;->a(Lcom/android/launcher3/taskbar/TaskbarDragLayer;)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;F)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/TaskbarDragLayer$a;->b(Lcom/android/launcher3/taskbar/TaskbarDragLayer;F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
