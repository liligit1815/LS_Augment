.class public Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;
.super Ljava/lang/Object;
.source "TaskbarEduTooltipController.kt"

# interfaces
.implements Lcom/android/launcher3/util/V1;
.implements Lcom/android/launcher3/taskbar/R1$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/TaskbarEduTooltipController$a;
    }
.end annotation


# static fields
.field public static final j:Lcom/android/launcher3/taskbar/TaskbarEduTooltipController$a;


# instance fields
.field private final g:Lcom/android/launcher3/taskbar/I1;

.field private h:Lcom/android/launcher3/taskbar/R1;

.field private i:Lcom/android/launcher3/taskbar/TaskbarEduTooltip;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->j:Lcom/android/launcher3/taskbar/TaskbarEduTooltipController$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "lookupContext(...)"

    .line 14
    .line 15
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    check-cast p1, Lcom/android/launcher3/taskbar/I1;

    .line 19
    .line 20
    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->g:Lcom/android/launcher3/taskbar/I1;

    .line 21
    .line 22
    return-void
.end method

.method private final A(Z)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/J3;->c:Lcom/android/launcher3/J3$a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->g:Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/android/launcher3/J3$a;->e(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/android/launcher3/util/H1;->h:Lcom/android/launcher3/X;

    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/J3;->s(Lcom/android/launcher3/H1;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private final B(Lcom/android/launcher3/taskbar/TaskbarEduTooltip;Landroid/widget/TextView;I)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroid/content/res/Configuration;->getLocales()Landroid/os/LocaleList;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v1, Landroid/text/SpannableString;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    new-instance v3, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string v4, "https://policies.google.com/privacy/embedded?hl="

    .line 34
    .line 35
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    new-instance v3, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    const-string v4, "https://policies.google.com/terms?hl="

    .line 55
    .line 56
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    filled-new-array {v2, p0}, [Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p1, p3, p0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const/16 p1, 0x3f

    .line 75
    .line 76
    invoke-static {p0, p1}, LH/b;->a(Ljava/lang/String;I)Landroid/text/Spanned;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-direct {v1, p0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1}, Landroid/text/SpannableString;->length()I

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    const-class p1, Landroid/text/style/URLSpan;

    .line 88
    .line 89
    invoke-virtual {v1, v0, p0, p1}, Landroid/text/SpannableString;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    const-string p1, "getSpans(...)"

    .line 94
    .line 95
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    array-length p1, p0

    .line 99
    :goto_0
    if-ge v0, p1, :cond_0

    .line 100
    .line 101
    aget-object p3, p0, v0

    .line 102
    .line 103
    check-cast p3, Landroid/text/style/URLSpan;

    .line 104
    .line 105
    invoke-virtual {p3}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    new-instance v3, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController$c;

    .line 110
    .line 111
    invoke-direct {v3, p3, v2}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController$c;-><init>(Landroid/text/style/URLSpan;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1, p3}, Landroid/text/SpannableString;->getSpanStart(Ljava/lang/Object;)I

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    invoke-virtual {v1, p3}, Landroid/text/SpannableString;->getSpanEnd(Ljava/lang/Object;)I

    .line 119
    .line 120
    .line 121
    move-result v4

    .line 122
    invoke-virtual {v1, p3}, Landroid/text/SpannableString;->getSpanFlags(Ljava/lang/Object;)I

    .line 123
    .line 124
    .line 125
    move-result v5

    .line 126
    invoke-virtual {v1, p3}, Landroid/text/SpannableString;->removeSpan(Ljava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v1, v3, v2, v4, v5}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 130
    .line 131
    .line 132
    add-int/lit8 v0, v0, 0x1

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_0
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 136
    .line 137
    .line 138
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method static synthetic C(Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;Lcom/android/launcher3/taskbar/TaskbarEduTooltip;Landroid/widget/TextView;IILjava/lang/Object;)V
    .locals 0

    .line 1
    if-nez p5, :cond_1

    .line 2
    .line 3
    and-int/lit8 p4, p4, 0x2

    .line 4
    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    const p3, 0x7f140430

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->B(Lcom/android/launcher3/taskbar/TaskbarEduTooltip;Landroid/widget/TextView;I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 15
    .line 16
    const-string p1, "Super calls with default arguments not supported in this target, function: showDisclosureText"

    .line 17
    .line 18
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    throw p0
.end method

.method public static synthetic b(Lcom/airbnb/lottie/LottieAnimationView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->k(Lcom/airbnb/lottie/LottieAnimationView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->u(Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->n(Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->p(Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final f()Lcom/android/launcher3/taskbar/TaskbarEduTooltipController$b;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController$b;-><init>(Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private static final k(Lcom/airbnb/lottie/LottieAnimationView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/airbnb/lottie/LottieAnimationView;->t()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/airbnb/lottie/LottieAnimationView;->u()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/airbnb/lottie/LottieAnimationView;->v()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private final m(I)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->h:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "controllers"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->v:La2/e;

    .line 13
    .line 14
    invoke-virtual {v0}, La2/e;->s()La2/a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/b;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {v0}, La2/a;->n()La2/h;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    const/4 v5, 0x0

    .line 27
    const v6, 0x7f0e0233

    .line 28
    .line 29
    .line 30
    invoke-virtual {v3, v6, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    const-string v4, "null cannot be cast to non-null type com.android.launcher3.taskbar.TaskbarEduTooltip"

    .line 35
    .line 36
    invoke-static {v3, v4}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    check-cast v3, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;

    .line 40
    .line 41
    iget-object v4, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->h:Lcom/android/launcher3/taskbar/R1;

    .line 42
    .line 43
    if-nez v4, :cond_1

    .line 44
    .line 45
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    move-object v1, v4

    .line 50
    :goto_0
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->m:Lcom/android/launcher3/taskbar/K1;

    .line 51
    .line 52
    const/16 v2, 0x8

    .line 53
    .line 54
    const/4 v4, 0x1

    .line 55
    invoke-virtual {v1, v2, v4}, Lcom/android/launcher3/taskbar/K1;->g(IZ)V

    .line 56
    .line 57
    .line 58
    new-instance v1, Lcom/android/launcher3/taskbar/C2;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/C2;-><init>(Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v3, v1}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->setOnCloseCallback(Lu4/a;)V

    .line 64
    .line 65
    .line 66
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->f()Lcom/android/launcher3/taskbar/TaskbarEduTooltipController$b;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->setAccessibilityDelegate(Landroid/view/View$AccessibilityDelegate;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/b;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->getContent()Landroid/view/ViewGroup;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, p1, v1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    iput-object v3, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->i:Lcom/android/launcher3/taskbar/TaskbarEduTooltip;

    .line 85
    .line 86
    return-void
.end method

.method private static final n(Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;)Lh4/t;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->i:Lcom/android/launcher3/taskbar/TaskbarEduTooltip;

    .line 3
    .line 4
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->h:Lcom/android/launcher3/taskbar/R1;

    .line 5
    .line 6
    const-string v2, "controllers"

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    move-object v1, v0

    .line 14
    :cond_0
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->m:Lcom/android/launcher3/taskbar/K1;

    .line 15
    .line 16
    const/16 v3, 0x8

    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    invoke-virtual {v1, v3, v4}, Lcom/android/launcher3/taskbar/K1;->g(IZ)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->h:Lcom/android/launcher3/taskbar/R1;

    .line 23
    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    move-object v0, p0

    .line 31
    :goto_0
    iget-object p0, v0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/a4;->N0(Z)V

    .line 35
    .line 36
    .line 37
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 38
    .line 39
    return-object p0
.end method

.method private static final p(Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->w()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final r()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->g:Lcom/android/launcher3/taskbar/I1;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c1()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->g:Lcom/android/launcher3/taskbar/I1;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->j1()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method private static final u(Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final v()V
    .locals 9

    .line 1
    invoke-static {}, Lf1/a;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->g:Lcom/android/launcher3/taskbar/I1;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_4

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->r()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_4

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->h()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x2

    .line 26
    if-gt v0, v1, :cond_4

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->h()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/4 v2, 0x1

    .line 33
    if-ge v0, v2, :cond_0

    .line 34
    .line 35
    goto/16 :goto_0

    .line 36
    .line 37
    :cond_0
    const/4 v0, 0x3

    .line 38
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->z(I)V

    .line 39
    .line 40
    .line 41
    const v0, 0x7f0e0230

    .line 42
    .line 43
    .line 44
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->m(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->i:Lcom/android/launcher3/taskbar/TaskbarEduTooltip;

    .line 48
    .line 49
    if-eqz v0, :cond_4

    .line 50
    .line 51
    invoke-virtual {v0, v2}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->setAllowTouchDismissal(Z)V

    .line 52
    .line 53
    .line 54
    sget-object v3, Lcom/android/wm/shell/shared/o;->a:Lcom/android/wm/shell/shared/o$a;

    .line 55
    .line 56
    const v2, 0x7f0b05d4

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    move-object v4, v2

    .line 64
    check-cast v4, Landroid/widget/TextView;

    .line 65
    .line 66
    sget-object v5, Lcom/android/wm/shell/shared/o$b;->B:Lcom/android/wm/shell/shared/o$b;

    .line 67
    .line 68
    const/4 v7, 0x4

    .line 69
    const/4 v8, 0x0

    .line 70
    const/4 v6, 0x0

    .line 71
    invoke-static/range {v3 .. v8}, Lcom/android/wm/shell/shared/o$a;->c(Lcom/android/wm/shell/shared/o$a;Landroid/widget/TextView;Lcom/android/wm/shell/shared/o$b;IILjava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    const v2, 0x7f0b047a

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    move-object v4, v2

    .line 82
    check-cast v4, Landroid/widget/TextView;

    .line 83
    .line 84
    sget-object v5, Lcom/android/wm/shell/shared/o$b;->u:Lcom/android/wm/shell/shared/o$b;

    .line 85
    .line 86
    invoke-static/range {v3 .. v8}, Lcom/android/wm/shell/shared/o$a;->c(Lcom/android/wm/shell/shared/o$a;Landroid/widget/TextView;Lcom/android/wm/shell/shared/o$b;IILjava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    const v2, 0x7f0b0586

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    const-string v3, "requireViewById(...)"

    .line 97
    .line 98
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    check-cast v2, Lcom/airbnb/lottie/LottieAnimationView;

    .line 102
    .line 103
    invoke-static {v2}, Lcom/android/launcher3/taskbar/D2;->a(Lcom/airbnb/lottie/LottieAnimationView;)V

    .line 104
    .line 105
    .line 106
    invoke-static {v2}, Li4/m;->d(Ljava/lang/Object;)Ljava/util/List;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {p0, v2}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->j(Ljava/util/List;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    if-eqz v2, :cond_3

    .line 118
    .line 119
    check-cast v2, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 120
    .line 121
    iget-object v3, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->g:Lcom/android/launcher3/taskbar/I1;

    .line 122
    .line 123
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    if-eqz v3, :cond_1

    .line 128
    .line 129
    iget v3, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 130
    .line 131
    iget-object v4, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->g:Lcom/android/launcher3/taskbar/I1;

    .line 132
    .line 133
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 134
    .line 135
    .line 136
    move-result-object v4

    .line 137
    iget v4, v4, Lcom/android/launcher3/h0;->r3:I

    .line 138
    .line 139
    add-int/2addr v3, v4

    .line 140
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 141
    .line 142
    :cond_1
    const/16 v3, 0x50

    .line 143
    .line 144
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 145
    .line 146
    const/4 v3, 0x0

    .line 147
    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    const v4, 0x7f070b80

    .line 155
    .line 156
    .line 157
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 162
    .line 163
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 164
    .line 165
    .line 166
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->h:Lcom/android/launcher3/taskbar/R1;

    .line 167
    .line 168
    if-nez p0, :cond_2

    .line 169
    .line 170
    const-string p0, "controllers"

    .line 171
    .line 172
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    const/4 p0, 0x0

    .line 176
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 177
    .line 178
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/W4;->R()Landroid/view/View;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-virtual {p0}, Landroid/view/View;->getX()F

    .line 183
    .line 184
    .line 185
    move-result v2

    .line 186
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 187
    .line 188
    .line 189
    move-result p0

    .line 190
    div-int/2addr p0, v1

    .line 191
    int-to-float p0, p0

    .line 192
    add-float/2addr v2, p0

    .line 193
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    iget p0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 198
    .line 199
    div-int/2addr p0, v1

    .line 200
    int-to-float p0, p0

    .line 201
    sub-float/2addr v2, p0

    .line 202
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setX(F)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->show()V

    .line 206
    .line 207
    .line 208
    return-void

    .line 209
    :cond_3
    new-instance p0, Ljava/lang/NullPointerException;

    .line 210
    .line 211
    const-string v0, "null cannot be cast to non-null type com.android.launcher3.views.BaseDragLayer.LayoutParams"

    .line 212
    .line 213
    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    throw p0

    .line 217
    :cond_4
    :goto_0
    return-void
.end method

.method public static final y(Landroid/content/Context;)Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->j:Lcom/android/launcher3/taskbar/TaskbarEduTooltipController$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController$a;->a(Landroid/content/Context;)Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private final z(I)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/H1;->b:Lcom/android/launcher3/util/H1$a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->g:Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p0}, Lcom/android/launcher3/util/H1$a;->e(ILandroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 3

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "TaskbarEduTooltipController:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    if-eqz p2, :cond_1

    .line 24
    .line 25
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->r()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v2, "\tisTooltipEnabled="

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    if-eqz p2, :cond_2

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->s()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    new-instance v1, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v2, "\tisOpen="

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    if-eqz p2, :cond_3

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->h()I

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string p1, "\ttooltipStep="

    .line 96
    .line 97
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    :cond_3
    return-void
.end method

.method public g()Z
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/util/ContextualSearchInvoker;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->g:Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/ContextualSearchInvoker;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/util/ContextualSearchInvoker;->runContextualSearchInvocationChecksAndLogFailures()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final h()I
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/H1;->b:Lcom/android/launcher3/util/H1$a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->g:Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/H1$a;->a(Landroid/content/Context;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final i()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/H1;->h:Lcom/android/launcher3/X;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->g:Lcom/android/launcher3/taskbar/I1;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/android/launcher3/X;->g(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public final j(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/airbnb/lottie/LottieAnimationView;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string p0, "animationViews"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/airbnb/lottie/LottieAnimationView;

    .line 21
    .line 22
    sget-object v0, Lcom/android/launcher3/E5;->e:Lcom/android/launcher3/util/I;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/android/launcher3/E5;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/launcher3/E5;->m()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/airbnb/lottie/LottieAnimationView;->u()V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    new-instance v0, Lcom/android/launcher3/taskbar/A2;

    .line 45
    .line 46
    invoke-direct {v0, p1}, Lcom/android/launcher3/taskbar/A2;-><init>(Lcom/airbnb/lottie/LottieAnimationView;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    return-void
.end method

.method public final l()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->i:Lcom/android/launcher3/taskbar/TaskbarEduTooltip;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/a;->close(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public final o(Lcom/android/launcher3/taskbar/R1;)V
    .locals 1

    .line 1
    const-string v0, "controllers"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->h:Lcom/android/launcher3/taskbar/R1;

    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->g:Lcom/android/launcher3/taskbar/I1;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance v0, Lcom/android/launcher3/taskbar/B2;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/B2;-><init>(Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final q()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->r()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->h()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 v0, 0x1

    .line 12
    if-gt p0, v0, :cond_0

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final s()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->i:Lcom/android/launcher3/taskbar/TaskbarEduTooltip;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public final t()V
    .locals 13

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->r()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_9

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->h()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-le v0, v1, :cond_0

    .line 13
    .line 14
    goto/16 :goto_3

    .line 15
    .line 16
    :cond_0
    const/4 v0, 0x3

    .line 17
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->z(I)V

    .line 18
    .line 19
    .line 20
    const v0, 0x7f0e022f

    .line 21
    .line 22
    .line 23
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->m(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->i:Lcom/android/launcher3/taskbar/TaskbarEduTooltip;

    .line 27
    .line 28
    if-eqz v0, :cond_8

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->setAllowTouchDismissal(Z)V

    .line 32
    .line 33
    .line 34
    const v2, 0x7f0b057c

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const-string v3, "requireViewById(...)"

    .line 42
    .line 43
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    check-cast v2, Lcom/airbnb/lottie/LottieAnimationView;

    .line 47
    .line 48
    const v4, 0x7f0b059f

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-static {v4, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    check-cast v4, Lcom/airbnb/lottie/LottieAnimationView;

    .line 59
    .line 60
    const v5, 0x7f0b0478

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    invoke-static {v5, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    check-cast v5, Lcom/airbnb/lottie/LottieAnimationView;

    .line 71
    .line 72
    const v6, 0x7f0b0479

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v6

    .line 79
    invoke-static {v6, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v2}, Lcom/android/launcher3/taskbar/D2;->a(Lcom/airbnb/lottie/LottieAnimationView;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v4}, Lcom/android/launcher3/taskbar/D2;->a(Lcom/airbnb/lottie/LottieAnimationView;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v5}, Lcom/android/launcher3/taskbar/D2;->a(Lcom/airbnb/lottie/LottieAnimationView;)V

    .line 89
    .line 90
    .line 91
    filled-new-array {v2, v4, v5}, [Lcom/airbnb/lottie/LottieAnimationView;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-static {v3}, Li4/m;->m([Ljava/lang/Object;)Ljava/util/List;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-virtual {p0, v3}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->j(Ljava/util/List;)V

    .line 100
    .line 101
    .line 102
    iget-object v3, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->g:Lcom/android/launcher3/taskbar/I1;

    .line 103
    .line 104
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    const/16 v5, 0x8

    .line 109
    .line 110
    if-eqz v3, :cond_2

    .line 111
    .line 112
    const v3, 0x7f130022

    .line 113
    .line 114
    .line 115
    invoke-virtual {v2, v3}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimation(I)V

    .line 116
    .line 117
    .line 118
    const v2, 0x7f130025

    .line 119
    .line 120
    .line 121
    invoke-virtual {v4, v2}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimation(I)V

    .line 122
    .line 123
    .line 124
    invoke-static {}, Lf1/a;->e()Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-eqz v2, :cond_1

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_1
    move v1, v5

    .line 132
    :goto_0
    invoke-virtual {v6, v1}, Landroid/view/View;->setVisibility(I)V

    .line 133
    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_2
    const v1, 0x7f130021

    .line 137
    .line 138
    .line 139
    invoke-virtual {v2, v1}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimation(I)V

    .line 140
    .line 141
    .line 142
    const v1, 0x7f130024

    .line 143
    .line 144
    .line 145
    invoke-virtual {v4, v1}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimation(I)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v6, v5}, Landroid/view/View;->setVisibility(I)V

    .line 149
    .line 150
    .line 151
    :goto_1
    sget-object v7, Lcom/android/wm/shell/shared/o;->a:Lcom/android/wm/shell/shared/o$a;

    .line 152
    .line 153
    const v1, 0x7f0b05d4

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    move-object v8, v1

    .line 161
    check-cast v8, Landroid/widget/TextView;

    .line 162
    .line 163
    sget-object v9, Lcom/android/wm/shell/shared/o$b;->B:Lcom/android/wm/shell/shared/o$b;

    .line 164
    .line 165
    const/4 v11, 0x4

    .line 166
    const/4 v12, 0x0

    .line 167
    const/4 v10, 0x0

    .line 168
    invoke-static/range {v7 .. v12}, Lcom/android/wm/shell/shared/o$a;->c(Lcom/android/wm/shell/shared/o$a;Landroid/widget/TextView;Lcom/android/wm/shell/shared/o$b;IILjava/lang/Object;)V

    .line 169
    .line 170
    .line 171
    const v1, 0x7f0b057d

    .line 172
    .line 173
    .line 174
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    move-object v8, v1

    .line 179
    check-cast v8, Landroid/widget/TextView;

    .line 180
    .line 181
    sget-object v9, Lcom/android/wm/shell/shared/o$b;->u:Lcom/android/wm/shell/shared/o$b;

    .line 182
    .line 183
    invoke-static/range {v7 .. v12}, Lcom/android/wm/shell/shared/o$a;->c(Lcom/android/wm/shell/shared/o$a;Landroid/widget/TextView;Lcom/android/wm/shell/shared/o$b;IILjava/lang/Object;)V

    .line 184
    .line 185
    .line 186
    const v1, 0x7f0b05a1

    .line 187
    .line 188
    .line 189
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    move-object v8, v1

    .line 194
    check-cast v8, Landroid/widget/TextView;

    .line 195
    .line 196
    invoke-static/range {v7 .. v12}, Lcom/android/wm/shell/shared/o$a;->c(Lcom/android/wm/shell/shared/o$a;Landroid/widget/TextView;Lcom/android/wm/shell/shared/o$b;IILjava/lang/Object;)V

    .line 197
    .line 198
    .line 199
    const v1, 0x7f0b047a

    .line 200
    .line 201
    .line 202
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    move-object v8, v1

    .line 207
    check-cast v8, Landroid/widget/TextView;

    .line 208
    .line 209
    invoke-static/range {v7 .. v12}, Lcom/android/wm/shell/shared/o$a;->c(Lcom/android/wm/shell/shared/o$a;Landroid/widget/TextView;Lcom/android/wm/shell/shared/o$b;IILjava/lang/Object;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->getContent()Landroid/view/ViewGroup;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 217
    .line 218
    .line 219
    move-result-object v2

    .line 220
    if-eqz v2, :cond_7

    .line 221
    .line 222
    const/4 v3, -0x1

    .line 223
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 224
    .line 225
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    if-eqz v1, :cond_6

    .line 233
    .line 234
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 235
    .line 236
    iget-object v2, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->g:Lcom/android/launcher3/taskbar/I1;

    .line 237
    .line 238
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 239
    .line 240
    .line 241
    move-result v2

    .line 242
    const v3, 0x7f070b82

    .line 243
    .line 244
    .line 245
    if-eqz v2, :cond_4

    .line 246
    .line 247
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    invoke-static {}, Lf1/a;->e()Z

    .line 252
    .line 253
    .line 254
    move-result v4

    .line 255
    if-eqz v4, :cond_3

    .line 256
    .line 257
    const v3, 0x7f070b81

    .line 258
    .line 259
    .line 260
    :cond_3
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 261
    .line 262
    .line 263
    move-result v2

    .line 264
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 265
    .line 266
    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 267
    .line 268
    iget-object v3, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->g:Lcom/android/launcher3/taskbar/I1;

    .line 269
    .line 270
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 271
    .line 272
    .line 273
    move-result-object v3

    .line 274
    iget v3, v3, Lcom/android/launcher3/h0;->r3:I

    .line 275
    .line 276
    add-int/2addr v2, v3

    .line 277
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 278
    .line 279
    goto :goto_2

    .line 280
    :cond_4
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 281
    .line 282
    .line 283
    move-result-object v2

    .line 284
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 285
    .line 286
    .line 287
    move-result v2

    .line 288
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 289
    .line 290
    :goto_2
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 291
    .line 292
    .line 293
    const v1, 0x7f0b0223

    .line 294
    .line 295
    .line 296
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 297
    .line 298
    .line 299
    move-result-object v1

    .line 300
    if-eqz v1, :cond_5

    .line 301
    .line 302
    new-instance v2, Lcom/android/launcher3/taskbar/z2;

    .line 303
    .line 304
    invoke-direct {v2, p0}, Lcom/android/launcher3/taskbar/z2;-><init>(Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;)V

    .line 305
    .line 306
    .line 307
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 308
    .line 309
    .line 310
    :cond_5
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->show()V

    .line 311
    .line 312
    .line 313
    return-void

    .line 314
    :cond_6
    new-instance p0, Ljava/lang/NullPointerException;

    .line 315
    .line 316
    const-string v0, "null cannot be cast to non-null type android.view.ViewGroup.MarginLayoutParams"

    .line 317
    .line 318
    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    throw p0

    .line 322
    :cond_7
    new-instance p0, Ljava/lang/NullPointerException;

    .line 323
    .line 324
    const-string v0, "null cannot be cast to non-null type android.view.ViewGroup.LayoutParams"

    .line 325
    .line 326
    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    throw p0

    .line 330
    :cond_8
    return-void

    .line 331
    :cond_9
    :goto_3
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->v()V

    .line 332
    .line 333
    .line 334
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->w()V

    .line 335
    .line 336
    .line 337
    return-void
.end method

.method public final w()V
    .locals 14

    .line 1
    invoke-static {}, Lf1/a;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_6

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->g:Lcom/android/launcher3/taskbar/I1;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->d1()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_6

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->r()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_6

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->g()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_6

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->i()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_6

    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->h:Lcom/android/launcher3/taskbar/R1;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    const-string v2, "controllers"

    .line 37
    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    move-object v0, v1

    .line 44
    :cond_0
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->l:Lcom/android/launcher3/taskbar/a4;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/a4;->i0()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_1

    .line 51
    .line 52
    goto/16 :goto_1

    .line 53
    .line 54
    :cond_1
    const/4 v0, 0x1

    .line 55
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->A(Z)V

    .line 56
    .line 57
    .line 58
    const v3, 0x7f0e0231

    .line 59
    .line 60
    .line 61
    invoke-direct {p0, v3}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->m(I)V

    .line 62
    .line 63
    .line 64
    iget-object v5, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->i:Lcom/android/launcher3/taskbar/TaskbarEduTooltip;

    .line 65
    .line 66
    if-eqz v5, :cond_6

    .line 67
    .line 68
    invoke-virtual {v5, v0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->setAllowTouchDismissal(Z)V

    .line 69
    .line 70
    .line 71
    const v0, 0x7f0b051e

    .line 72
    .line 73
    .line 74
    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const-string v3, "requireViewById(...)"

    .line 79
    .line 80
    invoke-static {v0, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    check-cast v0, Lcom/airbnb/lottie/LottieAnimationView;

    .line 84
    .line 85
    invoke-static {v0}, Lcom/android/launcher3/taskbar/D2;->a(Lcom/airbnb/lottie/LottieAnimationView;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v0}, Li4/m;->d(Ljava/lang/Object;)Ljava/util/List;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->j(Ljava/util/List;)V

    .line 93
    .line 94
    .line 95
    const v0, 0x7f0b051f

    .line 96
    .line 97
    .line 98
    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-static {v0, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    move-object v6, v0

    .line 106
    check-cast v6, Landroid/widget/TextView;

    .line 107
    .line 108
    sget-object v7, Lcom/android/wm/shell/shared/o;->a:Lcom/android/wm/shell/shared/o$a;

    .line 109
    .line 110
    const v0, 0x7f0b05d4

    .line 111
    .line 112
    .line 113
    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    move-object v8, v0

    .line 118
    check-cast v8, Landroid/widget/TextView;

    .line 119
    .line 120
    sget-object v9, Lcom/android/wm/shell/shared/o$b;->B:Lcom/android/wm/shell/shared/o$b;

    .line 121
    .line 122
    const/4 v11, 0x4

    .line 123
    const/4 v12, 0x0

    .line 124
    const/4 v10, 0x0

    .line 125
    invoke-static/range {v7 .. v12}, Lcom/android/wm/shell/shared/o$a;->c(Lcom/android/wm/shell/shared/o$a;Landroid/widget/TextView;Lcom/android/wm/shell/shared/o$b;IILjava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    sget-object v8, Lcom/android/wm/shell/shared/o$b;->v:Lcom/android/wm/shell/shared/o$b;

    .line 129
    .line 130
    const/4 v10, 0x4

    .line 131
    const/4 v11, 0x0

    .line 132
    const/4 v9, 0x0

    .line 133
    move-object v13, v7

    .line 134
    move-object v7, v6

    .line 135
    move-object v6, v13

    .line 136
    invoke-static/range {v6 .. v11}, Lcom/android/wm/shell/shared/o$a;->c(Lcom/android/wm/shell/shared/o$a;Landroid/widget/TextView;Lcom/android/wm/shell/shared/o$b;IILjava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    move-object v6, v7

    .line 140
    const/4 v8, 0x2

    .line 141
    const/4 v9, 0x0

    .line 142
    const/4 v7, 0x0

    .line 143
    move-object v4, p0

    .line 144
    invoke-static/range {v4 .. v9}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->C(Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;Lcom/android/launcher3/taskbar/TaskbarEduTooltip;Landroid/widget/TextView;IILjava/lang/Object;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    if-eqz p0, :cond_5

    .line 152
    .line 153
    check-cast p0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 154
    .line 155
    iget-object v0, v4, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->g:Lcom/android/launcher3/taskbar/I1;

    .line 156
    .line 157
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_2

    .line 162
    .line 163
    iget v0, p0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 164
    .line 165
    iget-object v3, v4, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->g:Lcom/android/launcher3/taskbar/I1;

    .line 166
    .line 167
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    iget v3, v3, Lcom/android/launcher3/h0;->r3:I

    .line 172
    .line 173
    add-int/2addr v0, v3

    .line 174
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 175
    .line 176
    :cond_2
    const/16 v0, 0x50

    .line 177
    .line 178
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 179
    .line 180
    const/4 v0, 0x0

    .line 181
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    const v3, 0x7f070b80

    .line 189
    .line 190
    .line 191
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 196
    .line 197
    invoke-virtual {v5, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 198
    .line 199
    .line 200
    iget-object p0, v4, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->h:Lcom/android/launcher3/taskbar/R1;

    .line 201
    .line 202
    if-nez p0, :cond_3

    .line 203
    .line 204
    invoke-static {v2}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    goto :goto_0

    .line 208
    :cond_3
    move-object v1, p0

    .line 209
    :goto_0
    iget-object p0, v1, Lcom/android/launcher3/taskbar/R1;->h:Lcom/android/launcher3/taskbar/W4;

    .line 210
    .line 211
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/W4;->J()Landroid/view/View;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    if-eqz p0, :cond_4

    .line 216
    .line 217
    invoke-virtual {p0}, Landroid/view/View;->getX()F

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 222
    .line 223
    .line 224
    move-result p0

    .line 225
    div-int/lit8 p0, p0, 0x2

    .line 226
    .line 227
    int-to-float p0, p0

    .line 228
    add-float/2addr v0, p0

    .line 229
    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    iget p0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 234
    .line 235
    div-int/lit8 p0, p0, 0x2

    .line 236
    .line 237
    int-to-float p0, p0

    .line 238
    sub-float/2addr v0, p0

    .line 239
    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->setX(F)V

    .line 240
    .line 241
    .line 242
    :cond_4
    invoke-virtual {v5}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->show()V

    .line 243
    .line 244
    .line 245
    return-void

    .line 246
    :cond_5
    new-instance p0, Ljava/lang/NullPointerException;

    .line 247
    .line 248
    const-string v0, "null cannot be cast to non-null type com.android.launcher3.views.BaseDragLayer.LayoutParams"

    .line 249
    .line 250
    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    throw p0

    .line 254
    :cond_6
    :goto_1
    return-void
.end method

.method public final x()V
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->r()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->g:Lcom/android/launcher3/taskbar/I1;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->h()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v0, 0x1

    .line 23
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->z(I)V

    .line 24
    .line 25
    .line 26
    const v0, 0x7f0e0232

    .line 27
    .line 28
    .line 29
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->m(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->i:Lcom/android/launcher3/taskbar/TaskbarEduTooltip;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    sget-object v1, Lcom/android/wm/shell/shared/o;->a:Lcom/android/wm/shell/shared/o$a;

    .line 37
    .line 38
    const v2, 0x7f0b05d4

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Landroid/widget/TextView;

    .line 46
    .line 47
    sget-object v3, Lcom/android/wm/shell/shared/o$b;->B:Lcom/android/wm/shell/shared/o$b;

    .line 48
    .line 49
    const/4 v5, 0x4

    .line 50
    const/4 v6, 0x0

    .line 51
    const/4 v4, 0x0

    .line 52
    invoke-static/range {v1 .. v6}, Lcom/android/wm/shell/shared/o$a;->c(Lcom/android/wm/shell/shared/o$a;Landroid/widget/TextView;Lcom/android/wm/shell/shared/o$b;IILjava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    const v1, 0x7f0b05a4

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->requireViewById(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    const-string v2, "requireViewById(...)"

    .line 63
    .line 64
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    check-cast v1, Lcom/airbnb/lottie/LottieAnimationView;

    .line 68
    .line 69
    invoke-static {v1}, Lcom/android/launcher3/taskbar/D2;->a(Lcom/airbnb/lottie/LottieAnimationView;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v1}, Li4/m;->d(Ljava/lang/Object;)Ljava/util/List;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {p0, v1}, Lcom/android/launcher3/taskbar/TaskbarEduTooltipController;->j(Ljava/util/List;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/TaskbarEduTooltip;->show()V

    .line 80
    .line 81
    .line 82
    :cond_1
    :goto_0
    return-void
.end method
