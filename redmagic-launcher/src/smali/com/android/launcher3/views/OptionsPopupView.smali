.class public Lcom/android/launcher3/views/OptionsPopupView;
.super Lcom/android/launcher3/popup/c;
.source "OptionsPopupView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/views/OptionsPopupView$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Lcom/android/launcher3/popup/c<",
        "TT;>;",
        "Landroid/view/View$OnClickListener;",
        "Landroid/view/View$OnLongClickListener;"
    }
.end annotation


# instance fields
.field private final g:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Landroid/view/View;",
            "Lcom/android/launcher3/views/OptionsPopupView$a;",
            ">;"
        }
    .end annotation
.end field

.field private h:Landroid/graphics/RectF;

.field private i:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/views/OptionsPopupView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/popup/c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p1, Landroid/util/ArrayMap;

    invoke-direct {p1}, Landroid/util/ArrayMap;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/views/OptionsPopupView;->g:Landroid/util/ArrayMap;

    return-void
.end method

.method public static synthetic Q(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/views/OptionsPopupView;->X(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic R(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/views/OptionsPopupView;->c0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic S(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/views/OptionsPopupView;->U(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static T(Landroid/view/View;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Landroid/content/Intent;

    .line 10
    .line 11
    const-string v1, "android.intent.action.ALL_APPS"

    .line 12
    .line 13
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/high16 v1, 0x20000000

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0
.end method

.method private static U(Landroid/view/View;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v0, Lcom/android/launcher3/V3;->r:Lcom/android/launcher3/V3;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public static V(Lcom/android/launcher3/C2;)Ljava/util/ArrayList;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/C2;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/views/OptionsPopupView$a;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/android/launcher3/views/OptionsPopupView$a;

    .line 7
    .line 8
    sget-object v5, Lcom/android/launcher3/logging/StatsLogManager$e;->h:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 9
    .line 10
    new-instance v6, Lcom/android/launcher3/views/L;

    .line 11
    .line 12
    invoke-direct {v6}, Lcom/android/launcher3/views/L;-><init>()V

    .line 13
    .line 14
    .line 15
    const v3, 0x7f14040d

    .line 16
    .line 17
    .line 18
    const v4, 0x7f080d57

    .line 19
    .line 20
    .line 21
    move-object v2, p0

    .line 22
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/views/OptionsPopupView$a;-><init>(Landroid/content/Context;IILcom/android/launcher3/logging/StatsLogManager$d;Landroid/view/View$OnLongClickListener;)V

    .line 23
    .line 24
    .line 25
    move-object v8, v2

    .line 26
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    new-instance v7, Lcom/android/launcher3/views/OptionsPopupView$a;

    .line 30
    .line 31
    sget-object v11, Lcom/android/launcher3/logging/StatsLogManager$e;->A:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 32
    .line 33
    new-instance v12, Lcom/android/launcher3/views/M;

    .line 34
    .line 35
    invoke-direct {v12}, Lcom/android/launcher3/views/M;-><init>()V

    .line 36
    .line 37
    .line 38
    const v9, 0x7f14047b

    .line 39
    .line 40
    .line 41
    const v10, 0x7f080d94

    .line 42
    .line 43
    .line 44
    invoke-direct/range {v7 .. v12}, Lcom/android/launcher3/views/OptionsPopupView$a;-><init>(Landroid/content/Context;IILcom/android/launcher3/logging/StatsLogManager$d;Landroid/view/View$OnLongClickListener;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    sget-object p0, Lf1/a;->b:Lf1/a$a;

    .line 51
    .line 52
    invoke-virtual {p0}, Lf1/a$a;->c()Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-eqz p0, :cond_0

    .line 57
    .line 58
    new-instance v7, Lcom/android/launcher3/views/OptionsPopupView$a;

    .line 59
    .line 60
    sget-object v11, Lcom/android/launcher3/logging/StatsLogManager$e;->y:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 61
    .line 62
    new-instance v12, Lcom/android/launcher3/views/N;

    .line 63
    .line 64
    invoke-direct {v12}, Lcom/android/launcher3/views/N;-><init>()V

    .line 65
    .line 66
    .line 67
    const v9, 0x7f140199

    .line 68
    .line 69
    .line 70
    const v10, 0x7f080b3c

    .line 71
    .line 72
    .line 73
    invoke-direct/range {v7 .. v12}, Lcom/android/launcher3/views/OptionsPopupView$a;-><init>(Landroid/content/Context;IILcom/android/launcher3/logging/StatsLogManager$d;Landroid/view/View$OnLongClickListener;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    :cond_0
    new-instance v7, Lcom/android/launcher3/views/OptionsPopupView$a;

    .line 80
    .line 81
    sget-object v11, Lcom/android/launcher3/logging/StatsLogManager$e;->z:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 82
    .line 83
    new-instance v12, Lcom/android/launcher3/views/O;

    .line 84
    .line 85
    invoke-direct {v12}, Lcom/android/launcher3/views/O;-><init>()V

    .line 86
    .line 87
    .line 88
    const v9, 0x7f14006a

    .line 89
    .line 90
    .line 91
    const v10, 0x7f080cf5

    .line 92
    .line 93
    .line 94
    invoke-direct/range {v7 .. v12}, Lcom/android/launcher3/views/OptionsPopupView$a;-><init>(Landroid/content/Context;IILcom/android/launcher3/logging/StatsLogManager$d;Landroid/view/View$OnLongClickListener;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    new-instance v7, Lcom/android/launcher3/views/OptionsPopupView$a;

    .line 101
    .line 102
    sget-object v11, Lcom/android/launcher3/logging/StatsLogManager$e;->y:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 103
    .line 104
    new-instance v12, Lcom/android/launcher3/views/P;

    .line 105
    .line 106
    invoke-direct {v12}, Lcom/android/launcher3/views/P;-><init>()V

    .line 107
    .line 108
    .line 109
    const v9, 0x7f140371

    .line 110
    .line 111
    .line 112
    const v10, 0x7f080d6d

    .line 113
    .line 114
    .line 115
    invoke-direct/range {v7 .. v12}, Lcom/android/launcher3/views/OptionsPopupView$a;-><init>(Landroid/content/Context;IILcom/android/launcher3/logging/StatsLogManager$d;Landroid/view/View$OnLongClickListener;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    return-object v0
.end method

.method private W(Landroid/view/View;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/OptionsPopupView;->g:Landroid/util/ArrayMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/views/OptionsPopupView$a;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    iget-object v2, v0, Lcom/android/launcher3/views/OptionsPopupView$a;->d:Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 14
    .line 15
    invoke-interface {v2}, Lcom/android/launcher3/logging/StatsLogManager$d;->getId()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-lez v2, :cond_1

    .line 20
    .line 21
    iget-object v2, p0, Lcom/android/launcher3/popup/c;->mActivityContext:Landroid/content/Context;

    .line 22
    .line 23
    check-cast v2, Lcom/android/launcher3/views/k;

    .line 24
    .line 25
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    iget-object v3, v0, Lcom/android/launcher3/views/OptionsPopupView$a;->d:Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 34
    .line 35
    invoke-interface {v2, v3}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    iget-object v0, v0, Lcom/android/launcher3/views/OptionsPopupView$a;->e:Landroid/view/View$OnLongClickListener;

    .line 39
    .line 40
    invoke-interface {v0, p1}, Landroid/view/View$OnLongClickListener;->onLongClick(Landroid/view/View;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    const/4 p1, 0x1

    .line 47
    invoke-virtual {p0, p1}, Lcom/android/launcher3/a;->close(Z)V

    .line 48
    .line 49
    .line 50
    return p1

    .line 51
    :cond_2
    return v1
.end method

.method private static X(Landroid/view/View;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/android/launcher3/q4$a;->l:Lcom/android/launcher3/q4$a;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/android/launcher3/C2;->H4(Lcom/android/launcher3/q4$a;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public static Y(Lcom/android/launcher3/C2;)Lcom/android/launcher3/widget/picker/WidgetsFullSheet;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/pm/PackageManager;->isSafeMode()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const v0, 0x7f140345

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0

    .line 24
    :cond_0
    const/16 v0, 0x10

    .line 25
    .line 26
    invoke-static {p0, v0}, Lcom/android/launcher3/a;->getTopOpenViewWithType(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    check-cast v0, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 33
    .line 34
    return-object v0

    .line 35
    :cond_1
    const/4 v0, 0x1

    .line 36
    invoke-static {p0, v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->V1(Lcom/android/launcher3/v;Z)Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method static Z(Landroid/content/Intent;)Lcom/android/launcher3/model/data/I;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/model/data/I;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p0, v0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 7
    .line 8
    const/16 p0, -0x6c

    .line 9
    .line 10
    iput p0, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 11
    .line 12
    return-object v0
.end method

.method public static a0(Lcom/android/launcher3/views/k;Landroid/graphics/RectF;Ljava/util/List;Z)Lcom/android/launcher3/views/OptionsPopupView;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/content/Context;",
            ":",
            "Lcom/android/launcher3/views/k;",
            ">(",
            "Lcom/android/launcher3/views/k;",
            "Landroid/graphics/RectF;",
            "Ljava/util/List<",
            "Lcom/android/launcher3/views/OptionsPopupView$a;",
            ">;Z)",
            "Lcom/android/launcher3/views/OptionsPopupView<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, p3, v0}, Lcom/android/launcher3/views/OptionsPopupView;->b0(Lcom/android/launcher3/views/k;Landroid/graphics/RectF;Ljava/util/List;ZI)Lcom/android/launcher3/views/OptionsPopupView;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method private static b0(Lcom/android/launcher3/views/k;Landroid/graphics/RectF;Ljava/util/List;ZI)Lcom/android/launcher3/views/OptionsPopupView;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/content/Context;",
            ":",
            "Lcom/android/launcher3/views/k;",
            ">(",
            "Lcom/android/launcher3/views/k;",
            "Landroid/graphics/RectF;",
            "Ljava/util/List<",
            "Lcom/android/launcher3/views/OptionsPopupView$a;",
            ">;ZI)",
            "Lcom/android/launcher3/views/OptionsPopupView<",
            "TT;>;"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v1, 0x0

    .line 14
    const v2, 0x7f0e012d

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/android/launcher3/views/OptionsPopupView;

    .line 22
    .line 23
    iput-object p1, p0, Lcom/android/launcher3/views/OptionsPopupView;->h:Landroid/graphics/RectF;

    .line 24
    .line 25
    invoke-virtual {p0, p3}, Lcom/android/launcher3/views/OptionsPopupView;->setShouldAddArrow(Z)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-eqz p2, :cond_2

    .line 37
    .line 38
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    check-cast p2, Lcom/android/launcher3/views/OptionsPopupView$a;

    .line 43
    .line 44
    const p3, 0x7f0e020f

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p3, p0}, Lcom/android/launcher3/popup/c;->inflateAndAdd(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    check-cast p3, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 52
    .line 53
    if-lez p4, :cond_1

    .line 54
    .line 55
    invoke-virtual {p3}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput p4, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 60
    .line 61
    :cond_1
    invoke-virtual {p3}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->getIconView()Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v1, p2, Lcom/android/launcher3/views/OptionsPopupView$a;->c:Landroid/graphics/drawable/Drawable;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p3}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->getBubbleText()Lcom/android/launcher3/BubbleTextView;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object v1, p2, Lcom/android/launcher3/views/OptionsPopupView$a;->b:Ljava/lang/CharSequence;

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p3, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p3, p0}, Landroid/widget/FrameLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/android/launcher3/views/OptionsPopupView;->g:Landroid/util/ArrayMap;

    .line 86
    .line 87
    invoke-virtual {v0, p3, p2}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->show()V

    .line 92
    .line 93
    .line 94
    return-object p0
.end method

.method private static c0(Landroid/view/View;)Z
    .locals 2

    .line 1
    const-string v0, "Main"

    .line 2
    .line 3
    const-string v1, "start: startSettings"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Landroid/content/Intent;

    .line 17
    .line 18
    const-string v1, "android.intent.action.APPLICATION_PREFERENCES"

    .line 19
    .line 20
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const v1, 0x10008000

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0
.end method

.method public static d0(Landroid/view/View;)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/android/launcher3/N5;->H(Landroid/content/Context;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStringCache()Lz1/G4;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStringCache()Lz1/G4;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    iget-object p0, p0, Lz1/G4;->n:Ljava/lang/String;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const p0, 0x7f14027b

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    :goto_0
    invoke-static {v0, p0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 41
    .line 42
    .line 43
    return v2

    .line 44
    :cond_1
    new-instance v1, Landroid/content/Intent;

    .line 45
    .line 46
    const-string v3, "android.intent.action.SET_WALLPAPER"

    .line 47
    .line 48
    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    const v3, 0x8000

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v3}, Lcom/android/launcher3/Workspace;->getWallpaperOffsetForCenterPage()F

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    const-string v4, "com.android.launcher3.WALLPAPER_OFFSET"

    .line 67
    .line 68
    invoke-virtual {v1, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const-string v3, "com.android.wallpaper.LAUNCH_SOURCE"

    .line 73
    .line 74
    const-string v4, "app_launched_launcher"

    .line 75
    .line 76
    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    const-string v3, "com.android.launcher3.WALLPAPER_FLAVOR"

    .line 81
    .line 82
    const-string v4, "focus_wallpaper"

    .line 83
    .line 84
    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    const v3, 0x7f140476

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    if-nez v4, :cond_2

    .line 100
    .line 101
    invoke-virtual {v1, v3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 102
    .line 103
    .line 104
    :cond_2
    invoke-static {v1}, Lcom/android/launcher3/views/OptionsPopupView;->Z(Landroid/content/Intent;)Lcom/android/launcher3/model/data/I;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-virtual {v0, p0, v1, v3}, Lcom/android/launcher3/C2;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    if-eqz p0, :cond_3

    .line 113
    .line 114
    const/4 p0, 0x1

    .line 115
    return p0

    .line 116
    :cond_3
    return v2
.end method


# virtual methods
.method public assignMarginsAndBackgrounds(Landroid/view/ViewGroup;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/c;->mColors:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget v0, v0, v1

    .line 5
    .line 6
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/popup/c;->assignMarginsAndBackgrounds(Landroid/view/ViewGroup;I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    add-int/lit8 v0, v0, -0x1

    .line 14
    .line 15
    :goto_0
    if-ge v1, v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 26
    .line 27
    iget v3, p0, Lcom/android/launcher3/popup/c;->mChildContainerMargin:I

    .line 28
    .line 29
    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 30
    .line 31
    add-int/lit8 v1, v1, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-void
.end method

.method protected getTargetObjectLocation(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/views/OptionsPopupView;->h:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/RectF;->roundOut(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    and-int/lit16 p0, p1, 0x1000

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/views/OptionsPopupView;->W(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    return v1

    .line 20
    :cond_1
    const/4 p1, 0x1

    .line 21
    invoke-virtual {p0, p1}, Lcom/android/launcher3/a;->close(Z)V

    .line 22
    .line 23
    .line 24
    return p1
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/views/OptionsPopupView;->W(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public setShouldAddArrow(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/views/OptionsPopupView;->i:Z

    .line 2
    .line 3
    return-void
.end method

.method public setTargetRect(Landroid/graphics/RectF;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/views/OptionsPopupView;->h:Landroid/graphics/RectF;

    .line 2
    .line 3
    return-void
.end method

.method protected shouldAddArrow()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/views/OptionsPopupView;->i:Z

    .line 2
    .line 3
    return p0
.end method
