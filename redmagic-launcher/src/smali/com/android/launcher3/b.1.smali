.class public final Lcom/android/launcher3/b;
.super Ljava/lang/Object;
.source "AbstractFloatingViewHelper.kt"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Lcom/android/launcher3/views/k;ZI)V
    .locals 3

    .line 1
    const-string p0, "activity"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    add-int/lit8 p1, p1, -0x1

    .line 15
    .line 16
    :goto_0
    const/4 v0, -0x1

    .line 17
    if-ge v0, p1, :cond_3

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    instance-of v1, v0, Lcom/android/launcher3/a;

    .line 24
    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    move-object v1, v0

    .line 28
    check-cast v1, Lcom/android/launcher3/a;

    .line 29
    .line 30
    invoke-virtual {v1, p3}, Lcom/android/launcher3/a;->isOfType(I)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    instance-of v2, v0, Lcom/android/launcher3/widget/CustomTransformSheet;

    .line 37
    .line 38
    if-nez v2, :cond_1

    .line 39
    .line 40
    instance-of v2, v0, Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 41
    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    invoke-virtual {v1, p2}, Lcom/android/launcher3/a;->close(Z)V

    .line 46
    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_1
    :goto_1
    check-cast v0, Lcom/android/launcher3/widget/o;

    .line 50
    .line 51
    const-wide/16 v1, 0xc8

    .line 52
    .line 53
    invoke-virtual {v0, p2, v1, v2}, Lcom/android/launcher3/views/f;->Y(ZJ)V

    .line 54
    .line 55
    .line 56
    :cond_2
    :goto_2
    add-int/lit8 p1, p1, -0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    return-void
.end method
