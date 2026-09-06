.class public Lcom/android/launcher3/widget/T;
.super Lcom/android/launcher3/widget/h;
.source "LauncherAppWidgetHostView.java"

# interfaces
.implements Lcom/android/launcher3/views/BaseDragLayer$c;
.implements Landroid/view/View$OnLongClickListener;
.implements Lcom/android/launcher3/blur/c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/T$a;
    }
.end annotation


# static fields
.field private static final T:Landroid/util/SparseBooleanArray;

.field private static final U:Ljava/lang/Integer;

.field public static V:Z


# instance fields
.field protected final A:Lcom/android/launcher3/views/k;

.field private B:Z

.field private C:Z

.field private D:Z

.field private E:Ljava/lang/Runnable;

.field private F:J

.field private G:Landroid/widget/RemoteViews;

.field private H:Z

.field private I:Z

.field private J:I

.field private K:I

.field private L:I

.field private M:Landroid/widget/RemoteViews;

.field private N:Ljava/lang/Boolean;

.field private O:[I

.field private final P:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private Q:Lx1/v;

.field private R:Z

.field private S:Lcom/android/launcher3/blur/a;

.field private y:Lcom/android/launcher3/widget/T$a;

.field private final z:Lcom/android/launcher3/V;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/util/SparseBooleanArray;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/widget/T;->T:Landroid/util/SparseBooleanArray;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sput-object v1, Lcom/android/launcher3/widget/T;->U:Ljava/lang/Integer;

    .line 14
    .line 15
    sput-boolean v0, Lcom/android/launcher3/widget/T;->V:Z

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/h;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/android/launcher3/widget/T;->F:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/android/launcher3/widget/T;->H:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/android/launcher3/widget/T;->I:Z

    .line 12
    .line 13
    iput v0, p0, Lcom/android/launcher3/widget/T;->J:I

    .line 14
    .line 15
    iput v0, p0, Lcom/android/launcher3/widget/T;->K:I

    .line 16
    .line 17
    iput v0, p0, Lcom/android/launcher3/widget/T;->L:I

    .line 18
    .line 19
    new-instance v1, Ljava/util/ArrayList;

    .line 20
    .line 21
    const-string v2, "com.zte.mifavorpad.weather"

    .line 22
    .line 23
    const-string v3, "com.android.contacts"

    .line 24
    .line 25
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lcom/android/launcher3/widget/T;->P:Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 43
    .line 44
    iput-object v1, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 45
    .line 46
    new-instance v2, Lcom/android/launcher3/V;

    .line 47
    .line 48
    invoke-direct {v2, p0, p0}, Lcom/android/launcher3/V;-><init>(Landroid/view/View;Landroid/view/View$OnLongClickListener;)V

    .line 49
    .line 50
    .line 51
    iput-object v2, p0, Lcom/android/launcher3/widget/T;->z:Lcom/android/launcher3/V;

    .line 52
    .line 53
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getAccessibilityDelegate()Landroid/view/View$AccessibilityDelegate;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {p0, v2}, Landroid/appwidget/AppWidgetHostView;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    .line 58
    .line 59
    .line 60
    const v2, 0x7f081a8a

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v2}, Landroid/appwidget/AppWidgetHostView;->setBackgroundResource(I)V

    .line 64
    .line 65
    .line 66
    invoke-static {}, Lcom/android/launcher3/y0;->t()Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eqz v2, :cond_0

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Landroid/appwidget/AppWidgetHostView;->setDefaultFocusHighlightEnabled(Z)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    const v0, 0x7f070332

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    iput p1, p0, Lcom/android/launcher3/widget/T;->J:I

    .line 87
    .line 88
    :cond_0
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getForeColor()I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    const/4 v0, -0x1

    .line 93
    if-eq p1, v0, :cond_1

    .line 94
    .line 95
    const/4 p1, 0x1

    .line 96
    invoke-virtual {p0, p1}, Landroid/appwidget/AppWidgetHostView;->setOnLightBackground(Z)V

    .line 97
    .line 98
    .line 99
    :cond_1
    return-void
.end method

.method private B()V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/T;->getAdvanceable()Landroid/widget/Advanceable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0}, Landroid/widget/Advanceable;->fyiWillBeAdvancedByHostKThx()V

    .line 10
    .line 11
    .line 12
    move v0, v1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move v0, v2

    .line 15
    :goto_0
    sget-object v3, Lcom/android/launcher3/widget/T;->T:Landroid/util/SparseBooleanArray;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    invoke-virtual {v3, v4}, Landroid/util/SparseBooleanArray;->indexOfKey(I)I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-ltz v4, :cond_1

    .line 26
    .line 27
    move v2, v1

    .line 28
    :cond_1
    if-eq v0, v2, :cond_3

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-virtual {v3, v0, v1}, Landroid/util/SparseBooleanArray;->put(IZ)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-virtual {v3, v0}, Landroid/util/SparseBooleanArray;->delete(I)V

    .line 45
    .line 46
    .line 47
    :goto_1
    invoke-direct {p0}, Lcom/android/launcher3/widget/T;->R()V

    .line 48
    .line 49
    .line 50
    :cond_3
    return-void
.end method

.method private C(Landroid/view/ViewGroup;)Z
    .locals 5

    .line 1
    instance-of v0, p1, Landroid/widget/AdapterView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    move v2, v0

    .line 9
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    if-ge v2, v3, :cond_2

    .line 14
    .line 15
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    instance-of v4, v3, Landroid/view/ViewGroup;

    .line 20
    .line 21
    if-eqz v4, :cond_1

    .line 22
    .line 23
    check-cast v3, Landroid/view/ViewGroup;

    .line 24
    .line 25
    invoke-direct {p0, v3}, Lcom/android/launcher3/widget/T;->C(Landroid/view/ViewGroup;)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_1

    .line 30
    .line 31
    return v1

    .line 32
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    return v0
.end method

.method private F(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_4

    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/widget/x0;->k:Lcom/android/launcher3/views/k;

    .line 8
    .line 9
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 14
    .line 15
    iget-boolean p1, p1, Lcom/android/launcher3/r4;->k:Z

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    instance-of p1, p1, Lcom/android/launcher3/model/data/y;

    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 39
    .line 40
    iget-boolean p1, p1, Lcom/android/launcher3/model/data/y;->isShowAppName:Z

    .line 41
    .line 42
    if-nez p1, :cond_0

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/T;->Z(Z)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 49
    .line 50
    instance-of v1, p1, Lcom/android/launcher3/C2;

    .line 51
    .line 52
    if-eqz v1, :cond_1

    .line 53
    .line 54
    check-cast p1, Lcom/android/launcher3/C2;

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->getDragInfo()Lc1/a;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 69
    .line 70
    invoke-direct {p0, p1, v1}, Lcom/android/launcher3/widget/T;->M(Lc1/a;Lcom/android/launcher3/model/data/y;)Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-nez p1, :cond_2

    .line 75
    .line 76
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 77
    .line 78
    const/4 v1, 0x2

    .line 79
    invoke-static {p1, v1}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    instance-of p1, p1, Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 84
    .line 85
    if-eqz p1, :cond_3

    .line 86
    .line 87
    iget-object p1, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 88
    .line 89
    invoke-static {p1, v1}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    check-cast p1, Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/android/launcher3/popup/c;->isAboveIcon()Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-nez p1, :cond_3

    .line 100
    .line 101
    :cond_2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/T;->Z(Z)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_3
    const/4 p1, 0x1

    .line 106
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/T;->Z(Z)V

    .line 107
    .line 108
    .line 109
    :cond_4
    return-void
.end method

.method private H()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->w()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/widget/T;->S:Lcom/android/launcher3/blur/a;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Lcom/android/launcher3/blur/a;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {v0, v1, p0}, Lcom/android/launcher3/blur/a;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/launcher3/widget/T;->S:Lcom/android/launcher3/blur/a;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/appwidget/AppWidgetHostView;->addView(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method

.method private L()Z
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/android/launcher3/widget/T;->F:J

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-gez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private M(Lc1/a;Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget p0, p1, Lcom/android/launcher3/util/C;->a:I

    .line 6
    .line 7
    iget v0, p2, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    iget p0, p1, Lcom/android/launcher3/util/C;->b:I

    .line 12
    .line 13
    iget v0, p2, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 14
    .line 15
    if-ne p0, v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Lc1/a;->b()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    iget p1, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 22
    .line 23
    if-ne p0, p1, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method private O()Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/appwidget/AppWidgetHostView;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const v3, 0x1020018

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2, v3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Ljava/lang/Integer;

    .line 21
    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    sget-object p0, Lcom/android/launcher3/widget/T;->U:Ljava/lang/Integer;

    .line 25
    .line 26
    invoke-virtual {p0, v2}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0

    .line 31
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    return v0
.end method

.method private R()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getHandler()Landroid/os/Handler;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getWindowVisibility()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v1, Lcom/android/launcher3/widget/T;->T:Landroid/util/SparseBooleanArray;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {v1, v2}, Landroid/util/SparseBooleanArray;->indexOfKey(I)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-ltz v1, :cond_0

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v1, 0x0

    .line 28
    :goto_0
    iget-boolean v2, p0, Lcom/android/launcher3/widget/T;->D:Z

    .line 29
    .line 30
    if-eq v1, v2, :cond_3

    .line 31
    .line 32
    iput-boolean v1, p0, Lcom/android/launcher3/widget/T;->D:Z

    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/widget/T;->E:Ljava/lang/Runnable;

    .line 35
    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    new-instance v1, Lcom/android/launcher3/widget/S;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/S;-><init>(Lcom/android/launcher3/widget/T;)V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Lcom/android/launcher3/widget/T;->E:Ljava/lang/Runnable;

    .line 44
    .line 45
    :cond_1
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iget-object v1, p0, Lcom/android/launcher3/widget/T;->E:Ljava/lang/Runnable;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    invoke-direct {p0}, Lcom/android/launcher3/widget/T;->X()V

    .line 53
    .line 54
    .line 55
    :cond_3
    return-void
.end method

.method public static V()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Lcom/android/launcher3/widget/T;->V:Z

    .line 3
    .line 4
    return-void
.end method

.method private W()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/T;->getAdvanceable()Landroid/widget/Advanceable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0}, Landroid/widget/Advanceable;->advance()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/widget/T;->X()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private X()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/T;->D:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    const-wide/16 v2, 0x4e20

    .line 11
    .line 12
    rem-long v4, v0, v2

    .line 13
    .line 14
    sub-long/2addr v2, v4

    .line 15
    add-long/2addr v0, v2

    .line 16
    sget-object v2, Lcom/android/launcher3/widget/T;->T:Landroid/util/SparseBooleanArray;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    invoke-virtual {v2, v3}, Landroid/util/SparseBooleanArray;->indexOfKey(I)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    int-to-long v2, v2

    .line 27
    const-wide/16 v4, 0xfa

    .line 28
    .line 29
    mul-long/2addr v2, v4

    .line 30
    add-long/2addr v0, v2

    .line 31
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getHandler()Landroid/os/Handler;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Lcom/android/launcher3/widget/T;->E:Ljava/lang/Runnable;

    .line 38
    .line 39
    invoke-virtual {v2, p0, v0, v1}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_0
    return-void
.end method

.method private getAdvanceable()Landroid/widget/Advanceable;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->autoAdvanceViewId:I

    .line 9
    .line 10
    const/4 v2, -0x1

    .line 11
    if-eq v0, v2, :cond_1

    .line 12
    .line 13
    iget-boolean v2, p0, Lcom/android/launcher3/widget/T;->C:Z

    .line 14
    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0, v0}, Landroid/appwidget/AppWidgetHostView;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    instance-of v0, p0, Landroid/widget/Advanceable;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    check-cast p0, Landroid/widget/Advanceable;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    :goto_0
    return-object v1
.end method

.method public static synthetic y(Lcom/android/launcher3/widget/T;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/T;->W()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private z()V
    .locals 5

    .line 1
    const v0, 0x7f0b033f

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/appwidget/AppWidgetHostView;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const v2, 0x7f0e011c

    .line 36
    .line 37
    .line 38
    const/4 v3, 0x0

    .line 39
    invoke-virtual {v1, v2, p0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Landroid/widget/TextView;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    if-eqz v2, :cond_1

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    instance-of v2, v2, Lcom/android/launcher3/widget/U;

    .line 56
    .line 57
    if-eqz v2, :cond_1

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, Lcom/android/launcher3/widget/U;

    .line 64
    .line 65
    iget-object v2, v2, Lcom/android/launcher3/widget/U;->v:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    iget v2, v0, Lcom/android/launcher3/h0;->C1:I

    .line 71
    .line 72
    int-to-float v2, v2

    .line 73
    invoke-virtual {v1, v3, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 74
    .line 75
    .line 76
    :cond_1
    const/4 v2, 0x1

    .line 77
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 78
    .line 79
    .line 80
    iget-object v4, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 81
    .line 82
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->c:Z

    .line 83
    .line 84
    if-nez v4, :cond_2

    .line 85
    .line 86
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 87
    .line 88
    .line 89
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 90
    .line 91
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 92
    .line 93
    .line 94
    :cond_2
    iget v0, v0, Lcom/android/launcher3/X3;->p0:I

    .line 95
    .line 96
    invoke-virtual {v1, v3, v0, v3, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, v1}, Landroid/appwidget/AppWidgetHostView;->addView(Landroid/view/View;)V

    .line 100
    .line 101
    .line 102
    new-instance p0, Lcom/android/launcher3/O6;

    .line 103
    .line 104
    invoke-direct {p0}, Lcom/android/launcher3/O6;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, v1}, Lcom/android/launcher3/O6;->g(Landroid/widget/TextView;)V

    .line 108
    .line 109
    .line 110
    return-void
.end method


# virtual methods
.method public A()V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x3e8

    .line 6
    .line 7
    add-long/2addr v0, v2

    .line 8
    iput-wide v0, p0, Lcom/android/launcher3/widget/T;->F:J

    .line 9
    .line 10
    return-void
.end method

.method protected D(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const p1, 0x7f0b033f

    .line 6
    .line 7
    .line 8
    if-ne p0, p1, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public E()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/widget/T;->y:Lcom/android/launcher3/widget/T$a;

    .line 3
    .line 4
    return-void
.end method

.method public G()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "endDeferringUpdates: mDeferredRemoteViews = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/widget/T;->M:Landroid/widget/RemoteViews;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    move-object v1, v2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {v1}, Landroid/widget/RemoteViews;->getPackage()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "LauncherAppWidgetHostView"

    .line 30
    .line 31
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    const-wide/16 v0, 0x0

    .line 35
    .line 36
    iput-wide v0, p0, Lcom/android/launcher3/widget/T;->F:J

    .line 37
    .line 38
    iput-object v2, p0, Lcom/android/launcher3/widget/T;->M:Landroid/widget/RemoteViews;

    .line 39
    .line 40
    iget-boolean v0, p0, Lcom/android/launcher3/widget/T;->H:Z

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/widget/T;->G:Landroid/widget/RemoteViews;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/T;->updateAppWidget(Landroid/widget/RemoteViews;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void
.end method

.method public I()Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/launcher3/widget/group/f;

    .line 2
    .line 3
    return p0
.end method

.method public J()Z
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/widget/group/f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/android/launcher3/widget/group/f;

    .line 6
    .line 7
    invoke-interface {p0}, Lcom/android/launcher3/widget/group/f;->b()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public K()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/T;->N()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-lez v0, :cond_2

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/appwidget/AppWidgetHostView;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    instance-of v0, v0, Lk2/m;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    invoke-virtual {p0, v1}, Landroid/appwidget/AppWidgetHostView;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Lk2/m;

    .line 29
    .line 30
    invoke-interface {p0}, Lk2/m;->a()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0

    .line 35
    :cond_2
    :goto_0
    return v1
.end method

.method public N()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/T;->R:Z

    .line 2
    .line 3
    return p0
.end method

.method protected P(FF)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected Q(FF)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v0, v2}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget v2, v0, Lcom/android/launcher3/X3;->m0:I

    .line 25
    .line 26
    int-to-float v2, v2

    .line 27
    cmpl-float v2, p1, v2

    .line 28
    .line 29
    if-lez v2, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    iget v3, v0, Lcom/android/launcher3/X3;->m0:I

    .line 36
    .line 37
    sub-int/2addr v2, v3

    .line 38
    int-to-float v2, v2

    .line 39
    cmpg-float p1, p1, v2

    .line 40
    .line 41
    if-gez p1, :cond_0

    .line 42
    .line 43
    iget p1, v0, Lcom/android/launcher3/X3;->n0:I

    .line 44
    .line 45
    int-to-float p1, p1

    .line 46
    cmpl-float p1, p2, p1

    .line 47
    .line 48
    if-lez p1, :cond_0

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getHeight()I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    iget p1, v0, Lcom/android/launcher3/X3;->o0:I

    .line 55
    .line 56
    sub-int/2addr p0, p1

    .line 57
    int-to-float p0, p0

    .line 58
    cmpg-float p0, p2, p0

    .line 59
    .line 60
    if-gez p0, :cond_0

    .line 61
    .line 62
    return v1

    .line 63
    :cond_0
    const/4 p0, 0x0

    .line 64
    return p0

    .line 65
    :cond_1
    return v1
.end method

.method protected S(FF)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public T()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->isAttachedToWindow()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/android/launcher3/model/data/A;

    .line 13
    .line 14
    const-string v1, "LauncherAppWidgetHostView"

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const-string p0, "reInflate: info is null."

    .line 19
    .line 20
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v3, "reInflate: info.providerName:"

    .line 30
    .line 31
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v3, v0, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 35
    .line 36
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v3, ", widget id: "

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget v3, v0, Lcom/android/launcher3/model/data/A;->g:I

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 57
    .line 58
    check-cast v1, Lcom/android/launcher3/C2;

    .line 59
    .line 60
    const/4 v2, 0x0

    .line 61
    const-string v3, "widget removed because of configuration change"

    .line 62
    .line 63
    invoke-virtual {v1, p0, v0, v2, v3}, Lcom/android/launcher3/C2;->o4(Landroid/view/View;Lcom/android/launcher3/model/data/y;ZLjava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 67
    .line 68
    check-cast p0, Lcom/android/launcher3/C2;

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Lcom/android/launcher3/C2;->a1(Lcom/android/launcher3/model/data/A;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public U()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    iput-object v0, p0, Lcom/android/launcher3/widget/T;->O:[I

    .line 5
    .line 6
    return-void
.end method

.method public Y()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/widget/T;->R:Z

    .line 3
    .line 4
    return-void
.end method

.method public Z(Z)V
    .locals 1

    .line 1
    const v0, 0x7f0b033f

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/appwidget/AppWidgetHostView;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    const/high16 p1, 0x3f800000    # 1.0f

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p1, 0x0

    .line 16
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/T;->z:Lcom/android/launcher3/V;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/V;->e()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/widget/T;->z:Lcom/android/launcher3/V;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/V;->c()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public cancelLongPress()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/appwidget/AppWidgetHostView;->cancelLongPress()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/widget/T;->z:Lcom/android/launcher3/V;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/V;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetHostView;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/T;->F(Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 3

    .line 1
    invoke-static {}, Lx1/O;->k1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/widget/T;->N()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/16 v2, 0x17

    .line 23
    .line 24
    if-ne v0, v2, :cond_2

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    const/4 v2, 0x0

    .line 28
    if-ne v1, v0, :cond_1

    .line 29
    .line 30
    sget-object p1, Lk2/k;->m:Lcom/android/launcher3/util/I;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lk2/k;

    .line 41
    .line 42
    invoke-virtual {p1, p0}, Lk2/k;->r(Lcom/android/launcher3/widget/T;)V

    .line 43
    .line 44
    .line 45
    return v2

    .line 46
    :cond_1
    if-nez v1, :cond_2

    .line 47
    .line 48
    return v2

    .line 49
    :cond_2
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/x0;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0

    .line 54
    :cond_3
    :goto_0
    invoke-super {p0, p1}, Lcom/android/launcher3/widget/x0;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    return p0
.end method

.method protected dispatchRestoreInstanceState(Landroid/util/SparseArray;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetHostView;->dispatchRestoreInstanceState(Landroid/util/SparseArray;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    new-instance p1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v0, "Exception: "

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "LauncherAppWidgetHostView"

    .line 24
    .line 25
    invoke-static {p1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/widget/T;->S(FF)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const-string v1, "LauncherAppWidgetHostView"

    .line 14
    .line 15
    const/4 v2, 0x3

    .line 16
    const/4 v3, 0x1

    .line 17
    if-eqz v0, :cond_6

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-static {p0, v0}, Lx1/v;->u(Landroid/view/View;Z)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_6

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/widget/T;->Q:Lx1/v;

    .line 27
    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    new-instance v0, Lx1/v;

    .line 31
    .line 32
    invoke-direct {v0, p0, v1, v3}, Lx1/v;-><init>(Landroid/view/View;Ljava/lang/String;Z)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/android/launcher3/widget/T;->Q:Lx1/v;

    .line 36
    .line 37
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/T;->Q:Lx1/v;

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/widget/T;->N()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    invoke-static {}, Lx1/O;->k1()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/widget/T;->Q(FF)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_3

    .line 78
    .line 79
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eq v0, v2, :cond_3

    .line 84
    .line 85
    :cond_2
    instance-of v0, p0, Lcom/android/launcher3/widget/suggest/m;

    .line 86
    .line 87
    if-eqz v0, :cond_4

    .line 88
    .line 89
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/widget/T;->P(FF)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_4

    .line 102
    .line 103
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/widget/T;->Q:Lx1/v;

    .line 104
    .line 105
    invoke-virtual {v0, p1}, Lx1/v;->g(Landroid/view/MotionEvent;)V

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eq v0, v3, :cond_5

    .line 114
    .line 115
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-ne v0, v2, :cond_8

    .line 120
    .line 121
    :cond_5
    invoke-virtual {p0}, Lcom/android/launcher3/widget/T;->G()V

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_6
    instance-of v0, p0, Lcom/android/launcher3/widget/suggest/m;

    .line 126
    .line 127
    if-eqz v0, :cond_8

    .line 128
    .line 129
    iget-object v0, p0, Lcom/android/launcher3/widget/T;->Q:Lx1/v;

    .line 130
    .line 131
    if-eqz v0, :cond_8

    .line 132
    .line 133
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-eq v0, v2, :cond_7

    .line 138
    .line 139
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-ne v0, v3, :cond_8

    .line 144
    .line 145
    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 148
    .line 149
    .line 150
    const-string v4, "dispatchTouchEvent SuggestWidgetHostView reset click scale, getAction="

    .line 151
    .line 152
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 156
    .line 157
    .line 158
    move-result v4

    .line 159
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    const-string v4, " getRawX="

    .line 163
    .line 164
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 168
    .line 169
    .line 170
    move-result v4

    .line 171
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    const-string v4, " getRawY="

    .line 175
    .line 176
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 180
    .line 181
    .line 182
    move-result v4

    .line 183
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    .line 192
    .line 193
    iget-object v0, p0, Lcom/android/launcher3/widget/T;->Q:Lx1/v;

    .line 194
    .line 195
    invoke-virtual {v0, p1}, Lx1/v;->g(Landroid/view/MotionEvent;)V

    .line 196
    .line 197
    .line 198
    :cond_8
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    and-int/lit16 v0, v0, 0xff

    .line 203
    .line 204
    if-ne v0, v3, :cond_a

    .line 205
    .line 206
    iget-object v0, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 207
    .line 208
    instance-of v1, v0, Lcom/android/launcher3/C2;

    .line 209
    .line 210
    if-eqz v1, :cond_a

    .line 211
    .line 212
    check-cast v0, Lcom/android/launcher3/C2;

    .line 213
    .line 214
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    invoke-virtual {v0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 219
    .line 220
    .line 221
    invoke-virtual {p0}, Lcom/android/launcher3/widget/T;->N()Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-eqz v0, :cond_9

    .line 226
    .line 227
    invoke-virtual {p0}, Lcom/android/launcher3/widget/T;->I()Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    if-nez v0, :cond_9

    .line 232
    .line 233
    invoke-static {}, Lx1/O;->k1()Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-eqz v0, :cond_c

    .line 238
    .line 239
    :cond_9
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    if-nez v0, :cond_c

    .line 248
    .line 249
    sput-boolean v3, Lcom/android/launcher3/widget/T;->V:Z

    .line 250
    .line 251
    goto :goto_1

    .line 252
    :cond_a
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    and-int/lit16 v0, v0, 0xff

    .line 257
    .line 258
    const/4 v1, 0x2

    .line 259
    if-eq v0, v1, :cond_b

    .line 260
    .line 261
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    and-int/lit16 v0, v0, 0xff

    .line 266
    .line 267
    if-ne v0, v2, :cond_c

    .line 268
    .line 269
    :cond_b
    iget-object v0, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 270
    .line 271
    instance-of v1, v0, Lcom/android/launcher3/C2;

    .line 272
    .line 273
    if-eqz v1, :cond_c

    .line 274
    .line 275
    check-cast v0, Lcom/android/launcher3/C2;

    .line 276
    .line 277
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    invoke-virtual {v0}, Lcom/android/launcher3/views/BaseDragLayer;->createActiveController()V

    .line 282
    .line 283
    .line 284
    :cond_c
    :goto_1
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetHostView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 285
    .line 286
    .line 287
    move-result p0

    .line 288
    return p0
.end method

.method protected drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 18
    .line 19
    invoke-static {v0}, Lx1/O;->t3(Landroid/content/ComponentName;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, p2}, Lcom/android/launcher3/widget/T;->D(Landroid/view/View;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    invoke-static {p0}, Lcom/android/launcher3/widget/I0;->d(Landroid/view/View;)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Landroid/graphics/Path;

    .line 61
    .line 62
    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 63
    .line 64
    .line 65
    new-instance v2, Landroid/graphics/RectF;

    .line 66
    .line 67
    iget v3, v0, Lcom/android/launcher3/X3;->m0:I

    .line 68
    .line 69
    int-to-float v3, v3

    .line 70
    iget v4, v0, Lcom/android/launcher3/X3;->n0:I

    .line 71
    .line 72
    int-to-float v4, v4

    .line 73
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getMeasuredWidth()I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    iget v6, v0, Lcom/android/launcher3/X3;->m0:I

    .line 78
    .line 79
    sub-int/2addr v5, v6

    .line 80
    int-to-float v5, v5

    .line 81
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getMeasuredHeight()I

    .line 82
    .line 83
    .line 84
    move-result v6

    .line 85
    iget v0, v0, Lcom/android/launcher3/X3;->o0:I

    .line 86
    .line 87
    sub-int/2addr v6, v0

    .line 88
    int-to-float v0, v6

    .line 89
    invoke-direct {v2, v3, v4, v5, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->getEnforcedCornerRadius()F

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->getEnforcedCornerRadius()F

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    sget-object v4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 101
    .line 102
    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 106
    .line 107
    .line 108
    invoke-super {p0, p1, p2, p3, p4}, Landroid/appwidget/AppWidgetHostView;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 113
    .line 114
    .line 115
    return p0

    .line 116
    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Landroid/appwidget/AppWidgetHostView;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    return p0
.end method

.method public getBgBlurImageView()Lcom/android/launcher3/blur/a;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/widget/T;->S:Lcom/android/launcher3/blur/a;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getCellChildViewPreLayoutListener()Lcom/android/launcher3/widget/T$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/T;->y:Lcom/android/launcher3/widget/T$a;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getChildMeasurePadding()Landroid/graphics/Rect;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getDelta()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/T;->O:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public getFocusedRect(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetHostView;->getFocusedRect(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Lcom/android/launcher3/widget/T;->J:I

    .line 5
    .line 6
    invoke-virtual {p1, p0, p0}, Landroid/graphics/Rect;->inset(II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public getLauncherAppWidgetProviderInfo()Lcom/android/launcher3/widget/U;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/android/launcher3/widget/U;

    .line 6
    .line 7
    return-object p0
.end method

.method public getOtherWidgetHostViewList()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroid/appwidget/AppWidgetHostView;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method protected l()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 11
    .line 12
    iget v0, p0, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    if-ne v0, v2, :cond_0

    .line 16
    .line 17
    iget p0, p0, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 18
    .line 19
    if-ne p0, v2, :cond_0

    .line 20
    .line 21
    return v2

    .line 22
    :cond_0
    return v1
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/appwidget/AppWidgetHostView;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/widget/T;->C:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/widget/T;->B()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/appwidget/AppWidgetHostView;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/widget/T;->C:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/widget/T;->B()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetHostView;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    instance-of p1, p1, Lcom/android/launcher3/model/data/y;

    .line 9
    .line 10
    if-eqz p1, :cond_2

    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 13
    .line 14
    instance-of p1, p1, Lcom/android/launcher3/C2;

    .line 15
    .line 16
    if-eqz p1, :cond_2

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 25
    .line 26
    check-cast p1, Lcom/android/launcher3/C2;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->getDragInfo()Lc1/a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 41
    .line 42
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/widget/T;->M(Lc1/a;Lcom/android/launcher3/model/data/y;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    iget-object p1, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 49
    .line 50
    const/4 v0, 0x2

    .line 51
    invoke-static {p1, v0}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    instance-of p1, p1, Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 56
    .line 57
    if-eqz p1, :cond_0

    .line 58
    .line 59
    iget-object p1, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 60
    .line 61
    invoke-static {p1, v0}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/android/launcher3/popup/c;->isAboveIcon()Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_1

    .line 72
    .line 73
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/widget/x0;->k:Lcom/android/launcher3/views/k;

    .line 74
    .line 75
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 80
    .line 81
    iget-boolean p1, p1, Lcom/android/launcher3/r4;->k:Z

    .line 82
    .line 83
    if-nez p1, :cond_1

    .line 84
    .line 85
    const/4 p1, 0x1

    .line 86
    goto :goto_0

    .line 87
    :cond_1
    const/4 p1, 0x0

    .line 88
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/T;->Z(Z)V

    .line 89
    .line 90
    .line 91
    :cond_2
    return-void
.end method

.method protected onFocusChanged(ZILandroid/graphics/Rect;)V
    .locals 3

    .line 1
    invoke-static {}, Lx1/O;->k1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const v0, 0x3f83d70a    # 1.03f

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 14
    .line 15
    :goto_0
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->animate()Landroid/view/ViewPropertyAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-wide/16 v1, 0xc8

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 34
    .line 35
    .line 36
    :cond_1
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/widget/x0;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetHostView;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "LauncherAppWidgetHostView"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-virtual {p0, v0, v2}, Lcom/android/launcher3/widget/T;->Q(FF)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    :cond_0
    instance-of v0, p0, Lcom/android/launcher3/widget/suggest/m;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-virtual {p0, v0, v2}, Lcom/android/launcher3/widget/T;->P(FF)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    :cond_1
    const-string p0, "onInterceptTouchEvent is not touch widget area"

    .line 42
    .line 43
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    const/4 p0, 0x0

    .line 47
    return p0

    .line 48
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    const/4 v2, 0x1

    .line 53
    if-nez v0, :cond_4

    .line 54
    .line 55
    iget-object v0, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 56
    .line 57
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-boolean v3, p0, Lcom/android/launcher3/widget/T;->B:Z

    .line 62
    .line 63
    if-eqz v3, :cond_3

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->requestDisallowInterceptTouchEvent(Z)V

    .line 66
    .line 67
    .line 68
    :cond_3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/views/BaseDragLayer;->setTouchCompleteListener(Lcom/android/launcher3/views/BaseDragLayer$c;)V

    .line 69
    .line 70
    .line 71
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/widget/T;->z:Lcom/android/launcher3/V;

    .line 72
    .line 73
    invoke-virtual {v0, p1}, Lcom/android/launcher3/V;->h(Landroid/view/MotionEvent;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eq v0, v2, :cond_5

    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    const/4 v0, 0x3

    .line 87
    if-ne p1, v0, :cond_7

    .line 88
    .line 89
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 90
    .line 91
    instance-of v0, p1, Lcom/android/launcher3/C2;

    .line 92
    .line 93
    if-eqz v0, :cond_7

    .line 94
    .line 95
    check-cast p1, Lcom/android/launcher3/C2;

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {p1}, Lcom/android/launcher3/menu/c;->s()Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-nez p1, :cond_6

    .line 106
    .line 107
    iget-object p1, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 108
    .line 109
    check-cast p1, Lcom/android/launcher3/C2;

    .line 110
    .line 111
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    sget-object v0, Lcom/android/launcher3/q4$a;->l:Lcom/android/launcher3/q4$a;

    .line 116
    .line 117
    invoke-virtual {p1, v0}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-eqz p1, :cond_7

    .line 122
    .line 123
    :cond_6
    const-string p0, "disable widget click in icon arrange"

    .line 124
    .line 125
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    return v2

    .line 129
    :cond_7
    iget-object p0, p0, Lcom/android/launcher3/widget/T;->z:Lcom/android/launcher3/V;

    .line 130
    .line 131
    invoke-virtual {p0}, Lcom/android/launcher3/V;->e()Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    return p0
.end method

.method protected onLayout(ZIIII)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x1

    .line 11
    if-eqz v1, :cond_8

    .line 12
    .line 13
    if-eqz v0, :cond_8

    .line 14
    .line 15
    sub-int/2addr p4, p2

    .line 16
    sub-int/2addr p5, p3

    .line 17
    move p1, v2

    .line 18
    :goto_0
    const/16 p2, 0x8

    .line 19
    .line 20
    if-ge p1, v0, :cond_4

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/appwidget/AppWidgetHostView;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    invoke-virtual {p3}, Landroid/view/View;->getVisibility()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eq v1, p2, :cond_3

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-static {p2}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {p2, v1}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    iget v1, p2, Lcom/android/launcher3/X3;->o0:I

    .line 49
    .line 50
    invoke-virtual {p0, p3}, Lcom/android/launcher3/widget/T;->D(Landroid/view/View;)Z

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    if-eqz v4, :cond_0

    .line 55
    .line 56
    sub-int p2, p5, v1

    .line 57
    .line 58
    invoke-virtual {p3, v2, p2, p4, p5}, Landroid/view/View;->layout(IIII)V

    .line 59
    .line 60
    .line 61
    goto :goto_3

    .line 62
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/widget/T;->getChildMeasurePadding()Landroid/graphics/Rect;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    if-nez v4, :cond_1

    .line 67
    .line 68
    iget v5, p2, Lcom/android/launcher3/X3;->m0:I

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_1
    iget v5, v4, Landroid/graphics/Rect;->left:I

    .line 72
    .line 73
    :goto_1
    if-nez v4, :cond_2

    .line 74
    .line 75
    iget v4, p2, Lcom/android/launcher3/X3;->m0:I

    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_2
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 79
    .line 80
    :goto_2
    iget p2, p2, Lcom/android/launcher3/X3;->n0:I

    .line 81
    .line 82
    sub-int v4, p4, v4

    .line 83
    .line 84
    sub-int v1, p5, v1

    .line 85
    .line 86
    invoke-virtual {p3, v5, p2, v4, v1}, Landroid/view/View;->layout(IIII)V

    .line 87
    .line 88
    .line 89
    :cond_3
    :goto_3
    add-int/lit8 p1, p1, 0x1

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 93
    .line 94
    invoke-static {p1, p2}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    if-nez p1, :cond_7

    .line 99
    .line 100
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    instance-of p1, p1, Lcom/android/launcher3/model/data/A;

    .line 105
    .line 106
    if-eqz p1, :cond_6

    .line 107
    .line 108
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    check-cast p1, Lcom/android/launcher3/model/data/A;

    .line 113
    .line 114
    iget p1, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 115
    .line 116
    if-eq p1, v3, :cond_5

    .line 117
    .line 118
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getTag()Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    check-cast p1, Lcom/android/launcher3/model/data/A;

    .line 123
    .line 124
    iget p1, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 125
    .line 126
    if-ne p1, v3, :cond_6

    .line 127
    .line 128
    :cond_5
    invoke-virtual {p0, v2}, Lcom/android/launcher3/widget/h;->setEnforcedCornerRadiusDefault(Z)V

    .line 129
    .line 130
    .line 131
    goto :goto_4

    .line 132
    :cond_6
    invoke-virtual {p0, v3}, Lcom/android/launcher3/widget/h;->setEnforcedCornerRadiusDefault(Z)V

    .line 133
    .line 134
    .line 135
    :cond_7
    :goto_4
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->s()V

    .line 136
    .line 137
    .line 138
    move-object v4, p0

    .line 139
    goto :goto_5

    .line 140
    :cond_8
    move-object v4, p0

    .line 141
    move v5, p1

    .line 142
    move v6, p2

    .line 143
    move v7, p3

    .line 144
    move v8, p4

    .line 145
    move v9, p5

    .line 146
    invoke-super/range {v4 .. v9}, Lcom/android/launcher3/widget/h;->onLayout(ZIIII)V

    .line 147
    .line 148
    .line 149
    :goto_5
    invoke-direct {v4}, Lcom/android/launcher3/widget/T;->O()Z

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    if-nez p0, :cond_a

    .line 154
    .line 155
    invoke-direct {v4, v4}, Lcom/android/launcher3/widget/T;->C(Landroid/view/ViewGroup;)Z

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    if-nez p0, :cond_a

    .line 160
    .line 161
    invoke-virtual {v4}, Lcom/android/launcher3/widget/T;->N()Z

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    if-eqz p0, :cond_9

    .line 166
    .line 167
    invoke-virtual {v4}, Lcom/android/launcher3/widget/T;->K()Z

    .line 168
    .line 169
    .line 170
    move-result p0

    .line 171
    if-nez p0, :cond_a

    .line 172
    .line 173
    :cond_9
    invoke-virtual {v4}, Lcom/android/launcher3/widget/T;->I()Z

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    if-eqz p0, :cond_b

    .line 178
    .line 179
    invoke-virtual {v4}, Lcom/android/launcher3/widget/T;->J()Z

    .line 180
    .line 181
    .line 182
    move-result p0

    .line 183
    if-eqz p0, :cond_b

    .line 184
    .line 185
    :cond_a
    move v2, v3

    .line 186
    :cond_b
    iput-boolean v2, v4, Lcom/android/launcher3/widget/T;->B:Z

    .line 187
    .line 188
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->k1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_2

    .line 7
    .line 8
    invoke-static {}, Lk2/k;->q()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/widget/T;->N()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/widget/T;->I()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/widget/T;->B:Z

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 32
    .line 33
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->requestDisallowInterceptTouchEvent(Z)V

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->performLongClick()Z

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_2
    :goto_0
    return v1
.end method

.method protected onMeasure(II)V
    .locals 14

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v6

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v8, 0x2

    .line 10
    const/4 v9, 0x0

    .line 11
    if-eqz v1, :cond_3

    .line 12
    .line 13
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 14
    .line 15
    .line 16
    move-result v10

    .line 17
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 18
    .line 19
    .line 20
    move-result v11

    .line 21
    invoke-virtual {p0, v10, v11}, Landroid/appwidget/AppWidgetHostView;->setMeasuredDimension(II)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getChildCount()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-lez v1, :cond_6

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v1, v2}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 43
    .line 44
    .line 45
    move-result-object v12

    .line 46
    move v13, v9

    .line 47
    :goto_0
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getChildCount()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-ge v13, v1, :cond_6

    .line 52
    .line 53
    invoke-virtual {p0, v13}, Landroid/appwidget/AppWidgetHostView;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    const/16 v3, 0x8

    .line 62
    .line 63
    if-eq v2, v3, :cond_2

    .line 64
    .line 65
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    invoke-virtual {p0, v1}, Lcom/android/launcher3/widget/T;->D(Landroid/view/View;)Z

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    if-eqz v4, :cond_0

    .line 78
    .line 79
    invoke-static {v10, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    iget v4, v12, Lcom/android/launcher3/X3;->o0:I

    .line 84
    .line 85
    invoke-static {v4, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    :goto_1
    move v4, v3

    .line 90
    goto :goto_3

    .line 91
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/widget/T;->getChildMeasurePadding()Landroid/graphics/Rect;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    if-nez v4, :cond_1

    .line 96
    .line 97
    iget v4, v12, Lcom/android/launcher3/X3;->m0:I

    .line 98
    .line 99
    mul-int/2addr v4, v8

    .line 100
    goto :goto_2

    .line 101
    :cond_1
    iget v5, v4, Landroid/graphics/Rect;->left:I

    .line 102
    .line 103
    iget v4, v4, Landroid/graphics/Rect;->right:I

    .line 104
    .line 105
    add-int/2addr v4, v5

    .line 106
    :goto_2
    sub-int v4, v10, v4

    .line 107
    .line 108
    invoke-static {v4, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    iget v4, v12, Lcom/android/launcher3/X3;->o0:I

    .line 113
    .line 114
    sub-int v4, v11, v4

    .line 115
    .line 116
    iget v5, v12, Lcom/android/launcher3/X3;->n0:I

    .line 117
    .line 118
    sub-int/2addr v4, v5

    .line 119
    invoke-static {v4, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    goto :goto_1

    .line 124
    :goto_3
    const/4 v3, 0x0

    .line 125
    const/4 v5, 0x0

    .line 126
    move-object v0, p0

    .line 127
    invoke-virtual/range {v0 .. v5}, Landroid/appwidget/AppWidgetHostView;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 128
    .line 129
    .line 130
    :cond_2
    add-int/lit8 v13, v13, 0x1

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_3
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {v1}, Lcom/android/launcher3/resource/B;->p()Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eqz v1, :cond_5

    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/android/launcher3/widget/T;->N()Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    if-eqz v1, :cond_5

    .line 148
    .line 149
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    const/high16 v2, 0x40000000    # 2.0f

    .line 154
    .line 155
    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 160
    .line 161
    .line 162
    move-result v3

    .line 163
    iget-object v4, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 164
    .line 165
    instance-of v5, v4, Lcom/android/launcher3/C2;

    .line 166
    .line 167
    if-eqz v5, :cond_4

    .line 168
    .line 169
    check-cast v4, Lcom/android/launcher3/C2;

    .line 170
    .line 171
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 172
    .line 173
    .line 174
    move-result-object v4

    .line 175
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 176
    .line 177
    .line 178
    move-result v4

    .line 179
    if-lez v4, :cond_4

    .line 180
    .line 181
    iget-object v3, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 182
    .line 183
    check-cast v3, Lcom/android/launcher3/C2;

    .line 184
    .line 185
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 186
    .line 187
    .line 188
    move-result-object v3

    .line 189
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 190
    .line 191
    .line 192
    move-result v3

    .line 193
    :cond_4
    invoke-static {v3, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    goto :goto_4

    .line 198
    :cond_5
    move v1, p1

    .line 199
    move/from16 v2, p2

    .line 200
    .line 201
    :goto_4
    invoke-super {p0, v1, v2}, Landroid/appwidget/AppWidgetHostView;->onMeasure(II)V

    .line 202
    .line 203
    .line 204
    :cond_6
    iget v1, p0, Lcom/android/launcher3/widget/T;->K:I

    .line 205
    .line 206
    if-lez v1, :cond_8

    .line 207
    .line 208
    iget v1, p0, Lcom/android/launcher3/widget/T;->L:I

    .line 209
    .line 210
    if-lez v1, :cond_8

    .line 211
    .line 212
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    if-eqz v1, :cond_7

    .line 217
    .line 218
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getChildCount()I

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    if-ne v1, v8, :cond_8

    .line 223
    .line 224
    goto :goto_5

    .line 225
    :cond_7
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getChildCount()I

    .line 226
    .line 227
    .line 228
    move-result v1

    .line 229
    const/4 v2, 0x1

    .line 230
    if-ne v1, v2, :cond_8

    .line 231
    .line 232
    :goto_5
    invoke-virtual {p0}, Lcom/android/launcher3/widget/T;->N()Z

    .line 233
    .line 234
    .line 235
    move-result v1

    .line 236
    if-nez v1, :cond_8

    .line 237
    .line 238
    invoke-virtual {p0, v9}, Landroid/appwidget/AppWidgetHostView;->getChildAt(I)Landroid/view/View;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    iget v2, p0, Lcom/android/launcher3/widget/T;->K:I

    .line 243
    .line 244
    invoke-static {v2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 245
    .line 246
    .line 247
    move-result v2

    .line 248
    iget v3, p0, Lcom/android/launcher3/widget/T;->L:I

    .line 249
    .line 250
    invoke-static {v3}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 251
    .line 252
    .line 253
    move-result v3

    .line 254
    invoke-virtual {p0, v1, v2, v3}, Landroid/appwidget/AppWidgetHostView;->measureChild(Landroid/view/View;II)V

    .line 255
    .line 256
    .line 257
    :cond_8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 258
    .line 259
    .line 260
    move-result-wide v1

    .line 261
    sub-long/2addr v1, v6

    .line 262
    const-wide/16 v3, 0x32

    .line 263
    .line 264
    cmp-long v3, v1, v3

    .line 265
    .line 266
    if-lez v3, :cond_9

    .line 267
    .line 268
    new-instance v3, Ljava/lang/StringBuilder;

    .line 269
    .line 270
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 271
    .line 272
    .line 273
    const-string v4, "onMeasure hao="

    .line 274
    .line 275
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    const-string v1, "ms getAppWidgetInfo="

    .line 282
    .line 283
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    .line 285
    .line 286
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    const-string v1, "LauncherAppWidgetHostView"

    .line 298
    .line 299
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 300
    .line 301
    .line 302
    :cond_9
    return-void
.end method

.method protected onSetAlpha(I)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/blur/f;->l(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetHostView;->onSetAlpha(I)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/appwidget/AppWidgetHostView;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    if-lez p3, :cond_0

    .line 5
    .line 6
    if-lez p4, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->s()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {p0, v0, v2}, Lcom/android/launcher3/widget/T;->Q(FF)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    :cond_0
    instance-of v0, p0, Lcom/android/launcher3/widget/suggest/m;

    .line 23
    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-virtual {p0, v0, v2}, Lcom/android/launcher3/widget/T;->P(FF)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_3

    .line 39
    .line 40
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eq p1, v1, :cond_2

    .line 45
    .line 46
    const/4 v0, 0x3

    .line 47
    if-eq p1, v0, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/widget/T;->cancelLongPress()V

    .line 51
    .line 52
    .line 53
    :goto_0
    const-string p0, "LauncherAppWidgetHostView"

    .line 54
    .line 55
    const-string p1, "onTouchEvent is not touch widget area"

    .line 56
    .line 57
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    const/4 p0, 0x0

    .line 61
    return p0

    .line 62
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/widget/T;->z:Lcom/android/launcher3/V;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V;->h(Landroid/view/MotionEvent;)V

    .line 65
    .line 66
    .line 67
    return v1
.end method

.method public onViewAdded(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetHostView;->onViewAdded(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/android/launcher3/widget/T;->H:Z

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/launcher3/widget/T;->L()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    or-int/2addr v0, v1

    .line 11
    iput-boolean v0, p0, Lcom/android/launcher3/widget/T;->H:Z

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/T;->D(Landroid/view/View;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    invoke-direct {p0}, Lcom/android/launcher3/widget/T;->z()V

    .line 26
    .line 27
    .line 28
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string v1, "onViewAdded child="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "LauncherAppWidgetHostView"

    .line 46
    .line 47
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    new-instance v0, Lcom/android/launcher3/O6;

    .line 51
    .line 52
    invoke-direct {v0}, Lcom/android/launcher3/O6;-><init>()V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 56
    .line 57
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/O6;->j(Landroid/content/Context;Landroid/view/View;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public onViewRemoved(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetHostView;->onViewRemoved(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/android/launcher3/widget/T;->H:Z

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/launcher3/widget/T;->L()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    or-int/2addr p1, v0

    .line 11
    iput-boolean p1, p0, Lcom/android/launcher3/widget/T;->H:Z

    .line 12
    .line 13
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetHostView;->onWindowVisibilityChanged(I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/widget/T;->R()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setAppWidget(ILandroid/appwidget/AppWidgetProviderInfo;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/widget/x0;->setAppWidget(ILandroid/appwidget/AppWidgetProviderInfo;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/android/launcher3/widget/T;->I:Z

    .line 5
    .line 6
    if-nez v0, :cond_3

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    if-eq p1, v0, :cond_3

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lcom/android/launcher3/widget/T;->I:Z

    .line 13
    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v2, "appwidget load-widget "

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-object v2, p2, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v1, p1}, Landroid/os/Trace;->beginAsyncSection(Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    new-instance v1, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    const-string v2, "App widget created with id: "

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const-string v1, "LauncherAppWidgetHostView"

    .line 54
    .line 55
    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/android/launcher3/widget/T;->N:Ljava/lang/Boolean;

    .line 59
    .line 60
    const/4 v1, 0x0

    .line 61
    if-nez p1, :cond_1

    .line 62
    .line 63
    instance-of p1, p2, Lcom/android/launcher3/widget/U;

    .line 64
    .line 65
    if-eqz p1, :cond_0

    .line 66
    .line 67
    check-cast p2, Lcom/android/launcher3/widget/U;

    .line 68
    .line 69
    iget-boolean p1, p2, Lcom/android/launcher3/widget/U;->t:Z

    .line 70
    .line 71
    if-eqz p1, :cond_0

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    move v0, v1

    .line 75
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iput-object p1, p0, Lcom/android/launcher3/widget/T;->N:Ljava/lang/Boolean;

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_1
    instance-of v2, p2, Lcom/android/launcher3/widget/U;

    .line 83
    .line 84
    if-eqz v2, :cond_2

    .line 85
    .line 86
    check-cast p2, Lcom/android/launcher3/widget/U;

    .line 87
    .line 88
    iget-boolean p2, p2, Lcom/android/launcher3/widget/U;->t:Z

    .line 89
    .line 90
    if-eqz p2, :cond_2

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_2
    move v0, v1

    .line 94
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eq p1, v0, :cond_3

    .line 99
    .line 100
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iput-object p1, p0, Lcom/android/launcher3/widget/T;->N:Ljava/lang/Boolean;

    .line 105
    .line 106
    invoke-virtual {p0}, Lcom/android/launcher3/widget/T;->T()V

    .line 107
    .line 108
    .line 109
    :cond_3
    :goto_2
    invoke-direct {p0}, Lcom/android/launcher3/widget/T;->H()V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public setCellChildViewPreLayoutListener(Lcom/android/launcher3/widget/T$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/T;->y:Lcom/android/launcher3/widget/T$a;

    .line 2
    .line 3
    return-void
.end method

.method public setColorResources(Landroid/util/SparseIntArray;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->resetColorResources()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetHostView;->setColorResources(Landroid/util/SparseIntArray;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setDelta([I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/T;->O:[I

    .line 2
    .line 3
    return-void
.end method

.method public setPadding(IIII)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_b

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v2, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 17
    .line 18
    check-cast v2, Landroid/content/Context;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    iget-object v3, v3, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 25
    .line 26
    invoke-static {v2, v3}, Lx1/O;->g4(Landroid/content/Context;Landroid/content/ComponentName;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const-string v3, "LauncherAppWidgetHostView"

    .line 31
    .line 32
    const/4 v4, 0x6

    .line 33
    const/4 v5, 0x2

    .line 34
    const/4 v6, 0x4

    .line 35
    if-eqz v2, :cond_4

    .line 36
    .line 37
    iget v2, v0, Lcom/android/launcher3/F1;->H0:I

    .line 38
    .line 39
    const/4 v7, 0x5

    .line 40
    if-ne v2, v7, :cond_1

    .line 41
    .line 42
    iget v7, v0, Lcom/android/launcher3/F1;->G0:I

    .line 43
    .line 44
    if-ne v7, v6, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    iget v2, v2, Landroid/content/res/Configuration;->orientation:I

    .line 55
    .line 56
    if-ne v2, v5, :cond_0

    .line 57
    .line 58
    const/16 v2, 0x4a

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    const/16 v2, 0x24

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    if-ne v2, v4, :cond_3

    .line 65
    .line 66
    iget v2, v0, Lcom/android/launcher3/F1;->G0:I

    .line 67
    .line 68
    if-ne v2, v6, :cond_3

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getResources()Landroid/content/res/Resources;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    iget v2, v2, Landroid/content/res/Configuration;->orientation:I

    .line 79
    .line 80
    if-ne v2, v5, :cond_2

    .line 81
    .line 82
    const/16 v2, 0x38

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_2
    const/16 v2, 0x18

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_3
    const/4 v2, -0x1

    .line 89
    :goto_0
    if-lez v2, :cond_8

    .line 90
    .line 91
    int-to-float p1, v2

    .line 92
    invoke-static {p1}, Lcom/android/launcher3/N5;->i(F)I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    new-instance p2, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .line 100
    .line 101
    const-string p3, "setPadding for google search widget left="

    .line 102
    .line 103
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    invoke-static {v3, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    move p3, p1

    .line 117
    move p2, v1

    .line 118
    move p4, p2

    .line 119
    goto :goto_2

    .line 120
    :cond_4
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    iget-object v2, v2, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 125
    .line 126
    invoke-static {v2}, Lx1/O;->f4(Landroid/content/ComponentName;)Z

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    if-eqz v2, :cond_7

    .line 131
    .line 132
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getResources()Landroid/content/res/Resources;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    iget v2, v2, Landroid/content/res/Configuration;->orientation:I

    .line 141
    .line 142
    const/4 v7, 0x1

    .line 143
    if-ne v2, v5, :cond_5

    .line 144
    .line 145
    move v2, v7

    .line 146
    goto :goto_1

    .line 147
    :cond_5
    move v2, v1

    .line 148
    :goto_1
    iget v5, v0, Lcom/android/launcher3/F1;->H0:I

    .line 149
    .line 150
    if-ne v5, v4, :cond_6

    .line 151
    .line 152
    iget v4, v0, Lcom/android/launcher3/F1;->G0:I

    .line 153
    .line 154
    if-ne v4, v6, :cond_6

    .line 155
    .line 156
    if-nez v2, :cond_6

    .line 157
    .line 158
    move p1, v1

    .line 159
    move p3, p1

    .line 160
    move p2, v7

    .line 161
    move p4, p2

    .line 162
    :cond_6
    new-instance v4, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 165
    .line 166
    .line 167
    const-string v5, "setPadding for needResizeForChromeDinoWidget "

    .line 168
    .line 169
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string v5, ", isLandscape="

    .line 176
    .line 177
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    .line 189
    .line 190
    goto :goto_2

    .line 191
    :cond_7
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    iget-object v2, v2, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 196
    .line 197
    invoke-static {v2}, Lx1/O;->h4(Landroid/content/ComponentName;)Z

    .line 198
    .line 199
    .line 200
    move-result v2

    .line 201
    if-eqz v2, :cond_8

    .line 202
    .line 203
    iget v2, v0, Lcom/android/launcher3/F1;->H0:I

    .line 204
    .line 205
    if-ne v2, v6, :cond_8

    .line 206
    .line 207
    iget v2, v0, Lcom/android/launcher3/F1;->G0:I

    .line 208
    .line 209
    if-ne v2, v4, :cond_8

    .line 210
    .line 211
    const/high16 v2, 0x3f800000    # 1.0f

    .line 212
    .line 213
    invoke-static {v2}, Lcom/android/launcher3/N5;->i(F)I

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    sub-int/2addr p4, v2

    .line 218
    :cond_8
    :goto_2
    invoke-static {}, Lm1/a;->a()Z

    .line 219
    .line 220
    .line 221
    move-result v2

    .line 222
    if-nez v2, :cond_9

    .line 223
    .line 224
    iget-object v2, p0, Lcom/android/launcher3/widget/x0;->k:Lcom/android/launcher3/views/k;

    .line 225
    .line 226
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 227
    .line 228
    .line 229
    move-result-object v2

    .line 230
    iget-object v2, v2, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 231
    .line 232
    iget-boolean v2, v2, Lcom/android/launcher3/r4;->Y:Z

    .line 233
    .line 234
    if-eqz v2, :cond_b

    .line 235
    .line 236
    :cond_9
    sget-object p1, Lx1/O;->V:Landroid/content/ComponentName;

    .line 237
    .line 238
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 239
    .line 240
    .line 241
    move-result-object p2

    .line 242
    iget-object p2, p2, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 243
    .line 244
    invoke-virtual {p1, p2}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 245
    .line 246
    .line 247
    move-result p1

    .line 248
    if-eqz p1, :cond_a

    .line 249
    .line 250
    goto :goto_3

    .line 251
    :cond_a
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    invoke-virtual {v0, p1}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    iget v1, p1, Lcom/android/launcher3/X3;->Z:I

    .line 260
    .line 261
    :goto_3
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getContext()Landroid/content/Context;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    invoke-virtual {v0, p1}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    iget p1, p1, Lcom/android/launcher3/X3;->Y:I

    .line 270
    .line 271
    invoke-super {p0, v1, p1, v1, p1}, Lcom/android/launcher3/widget/x0;->setPadding(IIII)V

    .line 272
    .line 273
    .line 274
    return-void

    .line 275
    :cond_b
    invoke-virtual {p0}, Lcom/android/launcher3/widget/h;->u()Z

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    if-nez v0, :cond_f

    .line 280
    .line 281
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    if-eqz v0, :cond_c

    .line 286
    .line 287
    iget-object v0, p0, Lcom/android/launcher3/widget/T;->P:Ljava/util/ArrayList;

    .line 288
    .line 289
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 290
    .line 291
    .line 292
    move-result-object v2

    .line 293
    iget-object v2, v2, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 294
    .line 295
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object v2

    .line 299
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 300
    .line 301
    .line 302
    move-result v0

    .line 303
    if-nez v0, :cond_f

    .line 304
    .line 305
    :cond_c
    invoke-static {}, Lx1/O;->x3()Z

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    if-eqz v0, :cond_d

    .line 310
    .line 311
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    iget-object v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 316
    .line 317
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v0

    .line 321
    const-string v2, "com.android.contacts"

    .line 322
    .line 323
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 324
    .line 325
    .line 326
    move-result v0

    .line 327
    if-eqz v0, :cond_d

    .line 328
    .line 329
    goto :goto_4

    .line 330
    :cond_d
    invoke-static {}, Lk2/k;->q()Z

    .line 331
    .line 332
    .line 333
    move-result v0

    .line 334
    if-eqz v0, :cond_e

    .line 335
    .line 336
    invoke-virtual {p0}, Lcom/android/launcher3/widget/T;->N()Z

    .line 337
    .line 338
    .line 339
    move-result v0

    .line 340
    if-eqz v0, :cond_e

    .line 341
    .line 342
    invoke-static {p0}, Lk2/k;->m(Lcom/android/launcher3/widget/T;)Lcom/android/systemui/plugins/CustomWidgetPlugin;

    .line 343
    .line 344
    .line 345
    move-result-object v0

    .line 346
    if-eqz v0, :cond_e

    .line 347
    .line 348
    invoke-interface {v0, p1, p2, p3, p4}, Lcom/android/systemui/plugins/CustomWidgetPlugin;->getWidgetPadding(IIII)Landroid/graphics/Rect;

    .line 349
    .line 350
    .line 351
    move-result-object v0

    .line 352
    if-eqz v0, :cond_e

    .line 353
    .line 354
    iget p1, v0, Landroid/graphics/Rect;->left:I

    .line 355
    .line 356
    iget p2, v0, Landroid/graphics/Rect;->top:I

    .line 357
    .line 358
    iget p3, v0, Landroid/graphics/Rect;->right:I

    .line 359
    .line 360
    iget p4, v0, Landroid/graphics/Rect;->bottom:I

    .line 361
    .line 362
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/launcher3/widget/x0;->setPadding(IIII)V

    .line 363
    .line 364
    .line 365
    return-void

    .line 366
    :cond_e
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/launcher3/widget/x0;->setPadding(IIII)V

    .line 367
    .line 368
    .line 369
    return-void

    .line 370
    :cond_f
    :goto_4
    invoke-super {p0, v1, v1, v1, v1}, Lcom/android/launcher3/widget/x0;->setPadding(IIII)V

    .line 371
    .line 372
    .line 373
    return-void
.end method

.method public setVisibility(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetHostView;->setVisibility(I)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    invoke-static {p0}, Lcom/android/launcher3/blur/f;->m(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public setWidgetTitleAlpha(F)V
    .locals 1

    .line 1
    const v0, 0x7f0b033f

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/appwidget/AppWidgetHostView;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public updateAppWidget(Landroid/widget/RemoteViews;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/T;->I:Z

    .line 2
    .line 3
    const-string v1, "LauncherAppWidgetHostView"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v2, "App widget with id: "

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v2, " loaded"

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v2, "appwidget load-widget "

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    iget-object v2, v2, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetId()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    invoke-static {v0, v2}, Landroid/os/Trace;->endAsyncSection(Ljava/lang/String;I)V

    .line 66
    .line 67
    .line 68
    const/4 v0, 0x0

    .line 69
    iput-boolean v0, p0, Lcom/android/launcher3/widget/T;->I:Z

    .line 70
    .line 71
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/widget/T;->G:Landroid/widget/RemoteViews;

    .line 72
    .line 73
    invoke-direct {p0}, Lcom/android/launcher3/widget/T;->L()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    iput-boolean v0, p0, Lcom/android/launcher3/widget/T;->H:Z

    .line 78
    .line 79
    if-eqz v0, :cond_1

    .line 80
    .line 81
    iput-object p1, p0, Lcom/android/launcher3/widget/T;->M:Landroid/widget/RemoteViews;

    .line 82
    .line 83
    const-string p0, "updateAppWidget isDeferringUpdates"

    .line 84
    .line 85
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_1
    const/4 v0, 0x0

    .line 90
    iput-object v0, p0, Lcom/android/launcher3/widget/T;->G:Landroid/widget/RemoteViews;

    .line 91
    .line 92
    iput-object v0, p0, Lcom/android/launcher3/widget/T;->M:Landroid/widget/RemoteViews;

    .line 93
    .line 94
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetHostView;->updateAppWidget(Landroid/widget/RemoteViews;)V

    .line 95
    .line 96
    .line 97
    if-eqz p1, :cond_2

    .line 98
    .line 99
    new-instance v0, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .line 103
    .line 104
    const-string v2, "updateAppWidget remoteViews.getPackage():"

    .line 105
    .line 106
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1}, Landroid/widget/RemoteViews;->getPackage()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    const-string v2, " ,densityDpi: "

    .line 117
    .line 118
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getResources()Landroid/content/res/Resources;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    iget v2, v2, Landroid/content/res/Configuration;->densityDpi:I

    .line 130
    .line 131
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string v2, " ,fontScale: "

    .line 135
    .line 136
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getResources()Landroid/content/res/Resources;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    iget v2, v2, Landroid/content/res/Configuration;->fontScale:F

    .line 148
    .line 149
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    :cond_2
    invoke-direct {p0}, Lcom/android/launcher3/widget/T;->B()V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 163
    .line 164
    instance-of v0, v0, Lcom/android/launcher3/C2;

    .line 165
    .line 166
    if-eqz v0, :cond_3

    .line 167
    .line 168
    new-instance v0, Lcom/android/launcher3/O6;

    .line 169
    .line 170
    invoke-direct {v0}, Lcom/android/launcher3/O6;-><init>()V

    .line 171
    .line 172
    .line 173
    iget-object v1, p0, Lcom/android/launcher3/widget/T;->A:Lcom/android/launcher3/views/k;

    .line 174
    .line 175
    check-cast v1, Lcom/android/launcher3/C2;

    .line 176
    .line 177
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    invoke-virtual {v0, p1, v1, p0, v2}, Lcom/android/launcher3/O6;->i(Landroid/widget/RemoteViews;Lcom/android/launcher3/C2;Lcom/android/launcher3/widget/T;Landroid/appwidget/AppWidgetProviderInfo;)V

    .line 182
    .line 183
    .line 184
    :cond_3
    return-void
.end method
