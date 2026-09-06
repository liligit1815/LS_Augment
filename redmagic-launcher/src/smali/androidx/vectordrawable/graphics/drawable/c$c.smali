.class Landroidx/vectordrawable/graphics/drawable/c$c;
.super Landroid/graphics/drawable/Drawable$ConstantState;
.source "AnimatedVectorDrawableCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/vectordrawable/graphics/drawable/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "c"
.end annotation


# instance fields
.field a:I

.field b:Landroidx/vectordrawable/graphics/drawable/f;

.field c:Landroid/animation/AnimatorSet;

.field d:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field e:Lo/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lo/a<",
            "Landroid/animation/Animator;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroidx/vectordrawable/graphics/drawable/c$c;Landroid/graphics/drawable/Drawable$Callback;Landroid/content/res/Resources;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_3

    .line 5
    .line 6
    iget p1, p2, Landroidx/vectordrawable/graphics/drawable/c$c;->a:I

    .line 7
    .line 8
    iput p1, p0, Landroidx/vectordrawable/graphics/drawable/c$c;->a:I

    .line 9
    .line 10
    iget-object p1, p2, Landroidx/vectordrawable/graphics/drawable/c$c;->b:Landroidx/vectordrawable/graphics/drawable/f;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Landroidx/vectordrawable/graphics/drawable/f;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-eqz p4, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1, p4}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Landroidx/vectordrawable/graphics/drawable/f;

    .line 26
    .line 27
    iput-object p1, p0, Landroidx/vectordrawable/graphics/drawable/c$c;->b:Landroidx/vectordrawable/graphics/drawable/f;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Landroidx/vectordrawable/graphics/drawable/f;

    .line 35
    .line 36
    iput-object p1, p0, Landroidx/vectordrawable/graphics/drawable/c$c;->b:Landroidx/vectordrawable/graphics/drawable/f;

    .line 37
    .line 38
    :goto_0
    iget-object p1, p0, Landroidx/vectordrawable/graphics/drawable/c$c;->b:Landroidx/vectordrawable/graphics/drawable/f;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroidx/vectordrawable/graphics/drawable/f;->mutate()Landroid/graphics/drawable/Drawable;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Landroidx/vectordrawable/graphics/drawable/f;

    .line 45
    .line 46
    iput-object p1, p0, Landroidx/vectordrawable/graphics/drawable/c$c;->b:Landroidx/vectordrawable/graphics/drawable/f;

    .line 47
    .line 48
    invoke-virtual {p1, p3}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Landroidx/vectordrawable/graphics/drawable/c$c;->b:Landroidx/vectordrawable/graphics/drawable/f;

    .line 52
    .line 53
    iget-object p3, p2, Landroidx/vectordrawable/graphics/drawable/c$c;->b:Landroidx/vectordrawable/graphics/drawable/f;

    .line 54
    .line 55
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    invoke-virtual {p1, p3}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Landroidx/vectordrawable/graphics/drawable/c$c;->b:Landroidx/vectordrawable/graphics/drawable/f;

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Landroidx/vectordrawable/graphics/drawable/f;->g(Z)V

    .line 65
    .line 66
    .line 67
    :cond_1
    iget-object p1, p2, Landroidx/vectordrawable/graphics/drawable/c$c;->d:Ljava/util/ArrayList;

    .line 68
    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    new-instance p3, Ljava/util/ArrayList;

    .line 76
    .line 77
    invoke-direct {p3, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 78
    .line 79
    .line 80
    iput-object p3, p0, Landroidx/vectordrawable/graphics/drawable/c$c;->d:Ljava/util/ArrayList;

    .line 81
    .line 82
    new-instance p3, Lo/a;

    .line 83
    .line 84
    invoke-direct {p3, p1}, Lo/a;-><init>(I)V

    .line 85
    .line 86
    .line 87
    iput-object p3, p0, Landroidx/vectordrawable/graphics/drawable/c$c;->e:Lo/a;

    .line 88
    .line 89
    :goto_1
    if-ge v0, p1, :cond_2

    .line 90
    .line 91
    iget-object p3, p2, Landroidx/vectordrawable/graphics/drawable/c$c;->d:Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p3

    .line 97
    check-cast p3, Landroid/animation/Animator;

    .line 98
    .line 99
    invoke-virtual {p3}, Landroid/animation/Animator;->clone()Landroid/animation/Animator;

    .line 100
    .line 101
    .line 102
    move-result-object p4

    .line 103
    iget-object v1, p2, Landroidx/vectordrawable/graphics/drawable/c$c;->e:Lo/a;

    .line 104
    .line 105
    invoke-virtual {v1, p3}, Lo/a;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p3

    .line 109
    check-cast p3, Ljava/lang/String;

    .line 110
    .line 111
    iget-object v1, p0, Landroidx/vectordrawable/graphics/drawable/c$c;->b:Landroidx/vectordrawable/graphics/drawable/f;

    .line 112
    .line 113
    invoke-virtual {v1, p3}, Landroidx/vectordrawable/graphics/drawable/f;->c(Ljava/lang/String;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {p4, v1}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    iget-object v1, p0, Landroidx/vectordrawable/graphics/drawable/c$c;->d:Ljava/util/ArrayList;

    .line 121
    .line 122
    invoke-virtual {v1, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    iget-object v1, p0, Landroidx/vectordrawable/graphics/drawable/c$c;->e:Lo/a;

    .line 126
    .line 127
    invoke-virtual {v1, p4, p3}, Lo/r;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    add-int/lit8 v0, v0, 0x1

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_2
    invoke-virtual {p0}, Landroidx/vectordrawable/graphics/drawable/c$c;->a()V

    .line 134
    .line 135
    .line 136
    :cond_3
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/vectordrawable/graphics/drawable/c$c;->c:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Landroidx/vectordrawable/graphics/drawable/c$c;->c:Landroid/animation/AnimatorSet;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Landroidx/vectordrawable/graphics/drawable/c$c;->c:Landroid/animation/AnimatorSet;

    .line 13
    .line 14
    iget-object p0, p0, Landroidx/vectordrawable/graphics/drawable/c$c;->d:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public getChangingConfigurations()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/vectordrawable/graphics/drawable/c$c;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public newDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "No constant state support for SDK < 24."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "No constant state support for SDK < 24."

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
