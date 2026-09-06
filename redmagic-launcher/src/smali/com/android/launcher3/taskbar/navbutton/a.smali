.class public abstract Lcom/android/launcher3/taskbar/navbutton/a;
.super Ljava/lang/Object;
.source "AbstractNavButtonLayoutter.kt"

# interfaces
.implements Lcom/android/launcher3/taskbar/navbutton/c$b;


# instance fields
.field private final a:Landroid/content/res/Resources;

.field private final b:Landroid/widget/LinearLayout;

.field private final c:Landroid/view/ViewGroup;

.field private final d:Landroid/view/ViewGroup;

.field private final e:Landroid/widget/ImageView;

.field private final f:Landroid/widget/ImageView;

.field private final g:Landroid/widget/Space;

.field private final h:Landroid/widget/ImageView;

.field private final i:Landroid/widget/ImageView;

.field private final j:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;Landroid/widget/LinearLayout;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/Space;)V
    .locals 1

    .line 1
    const-string v0, "resources"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "navButtonContainer"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "endContextualContainer"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "startContextualContainer"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/android/launcher3/taskbar/navbutton/a;->a:Landroid/content/res/Resources;

    .line 25
    .line 26
    iput-object p2, p0, Lcom/android/launcher3/taskbar/navbutton/a;->b:Landroid/widget/LinearLayout;

    .line 27
    .line 28
    iput-object p3, p0, Lcom/android/launcher3/taskbar/navbutton/a;->c:Landroid/view/ViewGroup;

    .line 29
    .line 30
    iput-object p4, p0, Lcom/android/launcher3/taskbar/navbutton/a;->d:Landroid/view/ViewGroup;

    .line 31
    .line 32
    iput-object p5, p0, Lcom/android/launcher3/taskbar/navbutton/a;->e:Landroid/widget/ImageView;

    .line 33
    .line 34
    iput-object p6, p0, Lcom/android/launcher3/taskbar/navbutton/a;->f:Landroid/widget/ImageView;

    .line 35
    .line 36
    iput-object p7, p0, Lcom/android/launcher3/taskbar/navbutton/a;->g:Landroid/widget/Space;

    .line 37
    .line 38
    const p1, 0x7f0b02d7

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Landroid/widget/ImageView;

    .line 46
    .line 47
    iput-object p1, p0, Lcom/android/launcher3/taskbar/navbutton/a;->h:Landroid/widget/ImageView;

    .line 48
    .line 49
    const p1, 0x7f0b04bc

    .line 50
    .line 51
    .line 52
    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Landroid/widget/ImageView;

    .line 57
    .line 58
    iput-object p1, p0, Lcom/android/launcher3/taskbar/navbutton/a;->i:Landroid/widget/ImageView;

    .line 59
    .line 60
    const p1, 0x7f0b00f4

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    check-cast p1, Landroid/widget/ImageView;

    .line 68
    .line 69
    iput-object p1, p0, Lcom/android/launcher3/taskbar/navbutton/a;->j:Landroid/widget/ImageView;

    .line 70
    .line 71
    if-eqz p1, :cond_2

    .line 72
    .line 73
    new-instance p0, Landroid/graphics/drawable/RotateDrawable;

    .line 74
    .line 75
    invoke-direct {p0}, Landroid/graphics/drawable/RotateDrawable;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    if-eqz p2, :cond_0

    .line 83
    .line 84
    const p3, 0x7f080d7b

    .line 85
    .line 86
    .line 87
    invoke-virtual {p2, p3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    goto :goto_0

    .line 92
    :cond_0
    const/4 p2, 0x0

    .line 93
    :goto_0
    invoke-virtual {p0, p2}, Landroid/graphics/drawable/RotateDrawable;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 94
    .line 95
    .line 96
    const/4 p2, 0x0

    .line 97
    invoke-virtual {p0, p2}, Landroid/graphics/drawable/RotateDrawable;->setFromDegrees(F)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-static {p2}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 105
    .line 106
    .line 107
    move-result p2

    .line 108
    if-eqz p2, :cond_1

    .line 109
    .line 110
    const/high16 p2, 0x42b40000    # 90.0f

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_1
    const/high16 p2, -0x3d4c0000    # -90.0f

    .line 114
    .line 115
    :goto_1
    invoke-virtual {p0, p2}, Landroid/graphics/drawable/RotateDrawable;->setToDegrees(F)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 119
    .line 120
    .line 121
    :cond_2
    return-void
.end method


# virtual methods
.method public final b(Landroid/widget/FrameLayout$LayoutParams;Lcom/android/launcher3/h0;)V
    .locals 2

    .line 1
    const-string v0, "nearestTouchFrameLayoutParams"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "deviceProfile"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/taskbar/navbutton/a;->a:Landroid/content/res/Resources;

    .line 12
    .line 13
    const v1, 0x7f070b7a

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 21
    .line 22
    .line 23
    iget-boolean p2, p2, Lcom/android/launcher3/h0;->N0:Z

    .line 24
    .line 25
    if-nez p2, :cond_0

    .line 26
    .line 27
    const/4 p2, 0x0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object p2, p0, Lcom/android/launcher3/taskbar/navbutton/a;->a:Landroid/content/res/Resources;

    .line 30
    .line 31
    const v1, 0x7f070ba2

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    div-int/lit8 p2, p2, 0x2

    .line 39
    .line 40
    sub-int p2, v0, p2

    .line 41
    .line 42
    :goto_0
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 43
    .line 44
    iget-object p0, p0, Lcom/android/launcher3/taskbar/navbutton/a;->a:Landroid/content/res/Resources;

    .line 45
    .line 46
    const p2, 0x7f070b79

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 54
    .line 55
    return-void
.end method

.method protected final c()Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/navbutton/a;->f:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method protected final d()Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/navbutton/a;->j:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method protected final e()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/navbutton/a;->c:Landroid/view/ViewGroup;

    .line 2
    .line 3
    return-object p0
.end method

.method protected final f()Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/navbutton/a;->h:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method protected final g()Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/navbutton/a;->e:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h()Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/navbutton/a;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i()Landroid/widget/FrameLayout$LayoutParams;
    .locals 1

    .line 1
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    invoke-direct {p0, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 5
    .line 6
    .line 7
    const/16 v0, 0x11

    .line 8
    .line 9
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 10
    .line 11
    return-object p0
.end method

.method protected final j()Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/navbutton/a;->i:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final k()Landroid/content/res/Resources;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/navbutton/a;->a:Landroid/content/res/Resources;

    .line 2
    .line 3
    return-object p0
.end method

.method protected final l()Landroid/widget/Space;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/navbutton/a;->g:Landroid/widget/Space;

    .line 2
    .line 3
    return-object p0
.end method

.method protected final m()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/navbutton/a;->d:Landroid/view/ViewGroup;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Landroid/view/ViewGroup;IIII)V
    .locals 1

    .line 1
    const-string p0, "contextualContainer"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    invoke-direct {p0, p2, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p4}, Landroid/widget/FrameLayout$LayoutParams;->setMarginEnd(I)V

    .line 16
    .line 17
    .line 18
    const/4 p2, 0x0

    .line 19
    iput p2, p0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 20
    .line 21
    iput p2, p0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 22
    .line 23
    or-int/lit8 p2, p5, 0x10

    .line 24
    .line 25
    iput p2, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
