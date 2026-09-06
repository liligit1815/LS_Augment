.class Landroidx/appcompat/widget/Toolbar$f;
.super Ljava/lang/Object;
.source "Toolbar.java"

# interfaces
.implements Landroidx/appcompat/view/menu/m;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/widget/Toolbar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "f"
.end annotation


# instance fields
.field g:Landroidx/appcompat/view/menu/g;

.field h:Landroidx/appcompat/view/menu/i;

.field final synthetic i:Landroidx/appcompat/widget/Toolbar;


# direct methods
.method constructor <init>(Landroidx/appcompat/widget/Toolbar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroidx/appcompat/view/menu/g;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(Landroidx/appcompat/view/menu/g;Landroidx/appcompat/view/menu/i;)Z
    .locals 3

    .line 1
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/appcompat/widget/Toolbar;->g()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 7
    .line 8
    iget-object p1, p1, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/widget/ImageButton;->getParent()Landroid/view/ViewParent;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 15
    .line 16
    if-eq p1, v0, :cond_1

    .line 17
    .line 18
    instance-of v1, p1, Landroid/view/ViewGroup;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    check-cast p1, Landroid/view/ViewGroup;

    .line 23
    .line 24
    iget-object v0, v0, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 30
    .line 31
    iget-object v0, p1, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 37
    .line 38
    invoke-virtual {p2}, Landroidx/appcompat/view/menu/i;->getActionView()Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p1, Landroidx/appcompat/widget/Toolbar;->o:Landroid/view/View;

    .line 43
    .line 44
    iput-object p2, p0, Landroidx/appcompat/widget/Toolbar$f;->h:Landroidx/appcompat/view/menu/i;

    .line 45
    .line 46
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 47
    .line 48
    iget-object p1, p1, Landroidx/appcompat/widget/Toolbar;->o:Landroid/view/View;

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 55
    .line 56
    if-eq p1, v0, :cond_3

    .line 57
    .line 58
    instance-of v1, p1, Landroid/view/ViewGroup;

    .line 59
    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    check-cast p1, Landroid/view/ViewGroup;

    .line 63
    .line 64
    iget-object v0, v0, Landroidx/appcompat/widget/Toolbar;->o:Landroid/view/View;

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 67
    .line 68
    .line 69
    :cond_2
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 70
    .line 71
    invoke-virtual {p1}, Landroidx/appcompat/widget/Toolbar;->m()Landroidx/appcompat/widget/Toolbar$g;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 76
    .line 77
    iget v1, v0, Landroidx/appcompat/widget/Toolbar;->t:I

    .line 78
    .line 79
    and-int/lit8 v1, v1, 0x70

    .line 80
    .line 81
    const v2, 0x800003

    .line 82
    .line 83
    .line 84
    or-int/2addr v1, v2

    .line 85
    iput v1, p1, Landroidx/appcompat/app/a$a;->a:I

    .line 86
    .line 87
    const/4 v1, 0x2

    .line 88
    iput v1, p1, Landroidx/appcompat/widget/Toolbar$g;->b:I

    .line 89
    .line 90
    iget-object v0, v0, Landroidx/appcompat/widget/Toolbar;->o:Landroid/view/View;

    .line 91
    .line 92
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 96
    .line 97
    iget-object v0, p1, Landroidx/appcompat/widget/Toolbar;->o:Landroid/view/View;

    .line 98
    .line 99
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 100
    .line 101
    .line 102
    :cond_3
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 103
    .line 104
    invoke-virtual {p1}, Landroidx/appcompat/widget/Toolbar;->I()V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 108
    .line 109
    invoke-virtual {p1}, Landroid/view/ViewGroup;->requestLayout()V

    .line 110
    .line 111
    .line 112
    const/4 p1, 0x1

    .line 113
    invoke-virtual {p2, p1}, Landroidx/appcompat/view/menu/i;->q(Z)V

    .line 114
    .line 115
    .line 116
    iget-object p2, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 117
    .line 118
    iget-object p2, p2, Landroidx/appcompat/widget/Toolbar;->o:Landroid/view/View;

    .line 119
    .line 120
    instance-of v0, p2, Landroidx/appcompat/view/c;

    .line 121
    .line 122
    if-eqz v0, :cond_4

    .line 123
    .line 124
    check-cast p2, Landroidx/appcompat/view/c;

    .line 125
    .line 126
    invoke-interface {p2}, Landroidx/appcompat/view/c;->onActionViewExpanded()V

    .line 127
    .line 128
    .line 129
    :cond_4
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 130
    .line 131
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->R()V

    .line 132
    .line 133
    .line 134
    return p1
.end method

.method public d(Landroidx/appcompat/view/menu/r;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public e(Landroidx/appcompat/view/menu/g;Landroidx/appcompat/view/menu/i;)Z
    .locals 1

    .line 1
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 2
    .line 3
    iget-object p1, p1, Landroidx/appcompat/widget/Toolbar;->o:Landroid/view/View;

    .line 4
    .line 5
    instance-of v0, p1, Landroidx/appcompat/view/c;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p1, Landroidx/appcompat/view/c;

    .line 10
    .line 11
    invoke-interface {p1}, Landroidx/appcompat/view/c;->onActionViewCollapsed()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 15
    .line 16
    iget-object v0, p1, Landroidx/appcompat/widget/Toolbar;->o:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 22
    .line 23
    iget-object v0, p1, Landroidx/appcompat/widget/Toolbar;->n:Landroid/widget/ImageButton;

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-object v0, p1, Landroidx/appcompat/widget/Toolbar;->o:Landroid/view/View;

    .line 32
    .line 33
    invoke-virtual {p1}, Landroidx/appcompat/widget/Toolbar;->a()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Landroidx/appcompat/widget/Toolbar$f;->h:Landroidx/appcompat/view/menu/i;

    .line 37
    .line 38
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/view/ViewGroup;->requestLayout()V

    .line 41
    .line 42
    .line 43
    const/4 p1, 0x0

    .line 44
    invoke-virtual {p2, p1}, Landroidx/appcompat/view/menu/i;->q(Z)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar$f;->i:Landroidx/appcompat/widget/Toolbar;

    .line 48
    .line 49
    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->R()V

    .line 50
    .line 51
    .line 52
    const/4 p0, 0x1

    .line 53
    return p0
.end method

.method public f(Landroid/content/Context;Landroidx/appcompat/view/menu/g;)V
    .locals 1

    .line 1
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar$f;->g:Landroidx/appcompat/view/menu/g;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar$f;->h:Landroidx/appcompat/view/menu/i;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroidx/appcompat/view/menu/g;->f(Landroidx/appcompat/view/menu/i;)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    iput-object p2, p0, Landroidx/appcompat/widget/Toolbar$f;->g:Landroidx/appcompat/view/menu/g;

    .line 13
    .line 14
    return-void
.end method

.method public flagActionItems()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public updateMenuView(Z)V
    .locals 3

    .line 1
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar$f;->h:Landroidx/appcompat/view/menu/i;

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar$f;->g:Landroidx/appcompat/view/menu/g;

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Landroidx/appcompat/view/menu/g;->size()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, 0x0

    .line 14
    :goto_0
    if-ge v0, p1, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Landroidx/appcompat/widget/Toolbar$f;->g:Landroidx/appcompat/view/menu/g;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroidx/appcompat/view/menu/g;->getItem(I)Landroid/view/MenuItem;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v2, p0, Landroidx/appcompat/widget/Toolbar$f;->h:Landroidx/appcompat/view/menu/i;

    .line 23
    .line 24
    if-ne v1, v2, :cond_0

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-object p1, p0, Landroidx/appcompat/widget/Toolbar$f;->g:Landroidx/appcompat/view/menu/g;

    .line 31
    .line 32
    iget-object v0, p0, Landroidx/appcompat/widget/Toolbar$f;->h:Landroidx/appcompat/view/menu/i;

    .line 33
    .line 34
    invoke-virtual {p0, p1, v0}, Landroidx/appcompat/widget/Toolbar$f;->e(Landroidx/appcompat/view/menu/g;Landroidx/appcompat/view/menu/i;)Z

    .line 35
    .line 36
    .line 37
    :cond_2
    return-void
.end method
