.class public final Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;
.super Lcom/android/launcher3/views/IconButtonView;
.source "TaskbarAllAppsButtonContainer.kt"


# instance fields
.field private final B0:Lcom/android/launcher3/taskbar/I1;

.field private C0:Z

.field private D0:Ljava/lang/Runnable;

.field private E0:J

.field private F0:Lcom/android/launcher3/taskbar/E4;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 7

    .line 1
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x6

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 7

    .line 2
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    const-string p3, "context"

    invoke-static {p1, p3}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/views/IconButtonView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 5
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p2

    const-string p3, "lookupContext(...)"

    invoke-static {p2, p3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p2, Lcom/android/launcher3/taskbar/I1;

    iput-object p2, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->B0:Lcom/android/launcher3/taskbar/I1;

    .line 6
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result p2

    int-to-long p2, p2

    iput-wide p2, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->E0:J

    const p2, 0x7f14006a

    .line 7
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 8
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->m1()V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    const/4 p3, 0x0

    .line 3
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic X0(Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->l1(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic Y0(Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->setUpCallbacks$lambda$0(Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z0(Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->k1(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic a1(Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->e1(Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b1(Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->j1(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c1(Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->f1(Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final d1()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->D0:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, LY1/e;

    .line 16
    .line 17
    invoke-direct {v0, p0}, LY1/e;-><init>(Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private static final e1(Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;)V
    .locals 1

    .line 1
    new-instance v0, LY1/f;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LY1/f;-><init>(Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static final f1(Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->C0:Z

    .line 3
    .line 4
    return-void
.end method

.method private final g1(Z)I
    .locals 1

    .line 1
    invoke-static {}, LH2/c;->j()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->getAllAppsButtonForExpressiveTheme()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    if-nez p1, :cond_2

    .line 13
    .line 14
    invoke-static {}, Lf1/a;->e()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->B0:Lcom/android/launcher3/taskbar/I1;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const p0, 0x7f080d86

    .line 30
    .line 31
    .line 32
    return p0

    .line 33
    :cond_2
    :goto_0
    const p0, 0x7f080d8a

    .line 34
    .line 35
    .line 36
    return p0
.end method

.method private final getAllAppsButtonForExpressiveTheme()I
    .locals 0

    .line 1
    const p0, 0x7f080d87

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method private final j1(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->C0:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->F0:Lcom/android/launcher3/taskbar/E4;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-string p0, "taskbarViewCallbacks"

    .line 10
    .line 11
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/E4;->G(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method private final k1(Landroid/view/View;)Z
    .locals 1

    .line 1
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->D0:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/os/Handler;->hasCallbacks(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->C0:Z

    .line 19
    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->F0:Lcom/android/launcher3/taskbar/E4;

    .line 23
    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    const-string p0, "taskbarViewCallbacks"

    .line 27
    .line 28
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/E4;->H()V

    .line 33
    .line 34
    .line 35
    :cond_1
    const/4 p0, 0x1

    .line 36
    return p0
.end method

.method private final l1(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x0

    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    if-eq p1, v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x3

    .line 12
    if-eq p1, v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->d1()V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    iput-boolean p2, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->C0:Z

    .line 20
    .line 21
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object v0, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->D0:Ljava/lang/Runnable;

    .line 28
    .line 29
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iget-wide v1, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->E0:J

    .line 33
    .line 34
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 35
    .line 36
    .line 37
    :goto_0
    return p2
.end method

.method private final m1()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UseCompatLoadingForDrawables",
            "ResourceAsColor"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->B0:Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->F0()LY1/h;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, LY1/h;->g()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-direct {p0, v1}, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->g1(Z)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/android/launcher3/views/IconButtonView;->setIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->B0:Lcom/android/launcher3/taskbar/I1;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->B0:Lcom/android/launcher3/taskbar/I1;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->G0()LY1/l;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, LY1/l;->c()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    int-to-float v0, v0

    .line 53
    invoke-static {v0}, Lcom/android/launcher3/N5;->i(F)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    invoke-virtual {p0, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 58
    .line 59
    .line 60
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->B0:Lcom/android/launcher3/taskbar/I1;

    .line 61
    .line 62
    const v1, 0x7f060036

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/view/ContextThemeWrapper;->getColor(I)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-virtual {p0, v0}, Lcom/android/launcher3/views/IconButtonView;->setForegroundTint(I)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method private static final setUpCallbacks$lambda$0(Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->F0:Lcom/android/launcher3/taskbar/E4;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "taskbarViewCallbacks"

    .line 6
    .line 7
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/E4;->H()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->C0:Z

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public getSpaceNeeded()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->B0:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->G0()LY1/l;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, LY1/l;->d()LY1/j;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, LY1/j;->a()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    int-to-float p0, p0

    .line 16
    invoke-static {p0}, Lcom/android/launcher3/N5;->i(F)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public final h1(Z)I
    .locals 1

    .line 1
    invoke-static {}, LH2/c;->j()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->i1(Z)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    if-eqz p1, :cond_1

    .line 13
    .line 14
    const p0, 0x7f070c1b

    .line 15
    .line 16
    .line 17
    return p0

    .line 18
    :cond_1
    const p0, 0x7f070b69

    .line 19
    .line 20
    .line 21
    return p0
.end method

.method public final i1(Z)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const p0, 0x7f070c1c

    .line 4
    .line 5
    .line 6
    return p0

    .line 7
    :cond_0
    const p0, 0x7f070b6a

    .line 8
    .line 9
    .line 10
    return p0
.end method

.method public bridge synthetic setForceHideRing(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/views/H;->setForceHideRing(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final setUpCallbacks(Lcom/android/launcher3/taskbar/E4;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    const-string v0, "callbacks"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->F0:Lcom/android/launcher3/taskbar/E4;

    .line 7
    .line 8
    new-instance p1, LY1/a;

    .line 9
    .line 10
    invoke-direct {p1, p0}, LY1/a;-><init>(Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    new-instance p1, LY1/b;

    .line 17
    .line 18
    invoke-direct {p1, p0}, LY1/b;-><init>(Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 22
    .line 23
    .line 24
    new-instance p1, LY1/c;

    .line 25
    .line 26
    invoke-direct {p1, p0}, LY1/c;-><init>(Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->F0:Lcom/android/launcher3/taskbar/E4;

    .line 33
    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    const-string p1, "taskbarViewCallbacks"

    .line 37
    .line 38
    invoke-static {p1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    :cond_0
    iget-object v0, p0, Landroid/widget/TextView;->mContext:Landroid/content/Context;

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Lcom/android/launcher3/taskbar/E4;->w(Landroid/content/Context;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setHapticFeedbackEnabled(Z)V

    .line 49
    .line 50
    .line 51
    new-instance p1, LY1/d;

    .line 52
    .line 53
    invoke-direct {p1, p0}, LY1/d;-><init>(Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;)V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->D0:Ljava/lang/Runnable;

    .line 57
    .line 58
    sget-object p1, Lcom/android/quickstep/util/ContextualSearchStateManager;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 59
    .line 60
    iget-object v0, p0, Landroid/widget/TextView;->mContext:Landroid/content/Context;

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 67
    .line 68
    sget-object v0, Lcom/android/quickstep/DeviceConfigWrapper;->Companion:Lcom/android/quickstep/DeviceConfigWrapper$Companion;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/android/quickstep/DeviceConfigWrapper$Companion;->get()Lcom/android/quickstep/DeviceConfigWrapper;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Lcom/android/quickstep/DeviceConfigWrapper;->getCustomLpaaThresholds()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_1

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/android/quickstep/util/ContextualSearchStateManager;->getLPNHDurationMillis()Ljava/util/Optional;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0}, Ljava/util/Optional;->isPresent()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_1

    .line 89
    .line 90
    invoke-virtual {p1}, Lcom/android/quickstep/util/ContextualSearchStateManager;->getLPNHDurationMillis()Ljava/util/Optional;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p1}, Ljava/util/Optional;->get()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    check-cast p1, Ljava/lang/Number;

    .line 99
    .line 100
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    .line 101
    .line 102
    .line 103
    move-result-wide v0

    .line 104
    iput-wide v0, p0, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->E0:J

    .line 105
    .line 106
    :cond_1
    return-void
.end method
