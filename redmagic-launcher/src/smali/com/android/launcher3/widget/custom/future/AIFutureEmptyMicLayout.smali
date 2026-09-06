.class public Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout;
.super Landroid/widget/FrameLayout;
.source "AIFutureEmptyMicLayout.java"


# instance fields
.field private g:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

.field private h:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout;->d(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout;->c(ZI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic c(ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout;->e()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e()V
    .locals 4

    .line 1
    const-string v0, "AIFutureEmptyMicLayout"

    .line 2
    .line 3
    const-string v1, "onMicImgClick"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const v1, 0x7f140052

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const v2, 0x7f140413

    .line 32
    .line 33
    .line 34
    filled-new-array {v0, v0}, [Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v1, v2, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout$a;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout$a;-><init>(Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout;)V

    .line 45
    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    invoke-static {v1, v2}, LK1/g;->c(Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;)LK1/g;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    new-instance v3, Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout$b;

    .line 53
    .line 54
    invoke-direct {v3, p0}, Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout$b;-><init>(Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v3, v2}, LK1/g;->c(Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnDismissListener;)LK1/g;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    new-instance v3, Lx1/e;

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-direct {v3, p0}, Lx1/e;-><init>(Landroid/content/Context;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v3, v0}, Lx1/e;->e(Ljava/lang/CharSequence;)Lx1/e;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const v0, 0x7f1400f7

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v0, v2}, Lx1/e;->f(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const v0, 0x7f140185

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, v0, v1}, Lx1/e;->j(ILandroid/content/DialogInterface$OnClickListener;)Lx1/e;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Lx1/e;->p()Landroid/app/Dialog;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {v1, p0}, LK1/g;->b(Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v2, p0}, LK1/g;->b(Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method private f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout;->h:Landroid/widget/ImageView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout;->g:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/CustomWidgetTextView;->a()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const p0, 0x7f08075e

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const p0, 0x7f08075d

    .line 16
    .line 17
    .line 18
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method protected onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b00a6

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout;->g:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 14
    .line 15
    const v0, 0x7f0b00a4

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/widget/ImageView;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout;->h:Landroid/widget/ImageView;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout;->g:Lcom/android/launcher3/widget/custom/CustomWidgetTextView;

    .line 27
    .line 28
    new-instance v1, Lcom/android/launcher3/widget/custom/future/a;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/future/a;-><init>(Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/custom/CustomWidgetTextView;->setOnTextColorChangedCallback(Lcom/android/launcher3/widget/custom/CustomWidgetTextView$a;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout;->f()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout;->h:Landroid/widget/ImageView;

    .line 40
    .line 41
    new-instance v1, Lcom/android/launcher3/widget/custom/future/b;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/future/b;-><init>(Lcom/android/launcher3/widget/custom/future/AIFutureEmptyMicLayout;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method
