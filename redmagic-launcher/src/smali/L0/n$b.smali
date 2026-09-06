.class public LL0/n$b;
.super Ljava/lang/Object;
.source "ViewCapture.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LL0/n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "b"
.end annotation


# instance fields
.field public A:LL0/n$b;

.field public B:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "LL0/n$b;",
            ">;"
        }
    .end annotation
.end field

.field public C:J

.field public g:Landroid/view/View;

.field public h:Ljava/lang/Class;

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:F

.field public r:F

.field public s:F

.field public t:F

.field public u:F

.field public v:F

.field public w:I

.field public x:Z

.field public y:Z

.field public z:I


# direct methods
.method protected constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, LL0/n$b;->z:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, LL0/n$b;->B:Ljava/util/function/Consumer;

    .line 9
    .line 10
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    iput-wide v0, p0, LL0/n$b;->C:J

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, LL0/n$b;->g:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, LL0/n$b;->h:Ljava/lang/Class;

    .line 8
    .line 9
    iget-object v0, p0, LL0/n$b;->g:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, LL0/n$b;->i:I

    .line 16
    .line 17
    iget-object v0, p0, LL0/n$b;->g:Landroid/view/View;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/View;->getId()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, LL0/n$b;->j:I

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, LL0/n$b;->g:Landroid/view/View;

    .line 27
    .line 28
    return-void
.end method

.method public b(LL0/n$a;Ljava/util/ArrayList;LM0/c$b;)LL0/n$b;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LL0/n$a;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Class;",
            ">;",
            "LM0/c$b;",
            ")",
            "LL0/n$b;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LL0/n$b;->h:Ljava/lang/Class;

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-gez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, LL0/n$b;->h:Ljava/lang/Class;

    .line 14
    .line 15
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-virtual {p3, v0}, LM0/c$b;->c(I)LM0/c$b;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget v1, p0, LL0/n$b;->i:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, LM0/c$b;->h(I)LM0/c$b;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget v1, p0, LL0/n$b;->j:I

    .line 29
    .line 30
    invoke-virtual {p1, v1}, LL0/n$a;->a(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, LM0/c$b;->k(Ljava/lang/String;)LM0/c$b;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget v1, p0, LL0/n$b;->k:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, LM0/c$b;->l(I)LM0/c$b;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget v1, p0, LL0/n$b;->l:I

    .line 45
    .line 46
    invoke-virtual {v0, v1}, LM0/c$b;->q(I)LM0/c$b;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget v1, p0, LL0/n$b;->m:I

    .line 51
    .line 52
    iget v2, p0, LL0/n$b;->k:I

    .line 53
    .line 54
    sub-int/2addr v1, v2

    .line 55
    invoke-virtual {v0, v1}, LM0/c$b;->u(I)LM0/c$b;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget v1, p0, LL0/n$b;->n:I

    .line 60
    .line 61
    iget v2, p0, LL0/n$b;->l:I

    .line 62
    .line 63
    sub-int/2addr v1, v2

    .line 64
    invoke-virtual {v0, v1}, LM0/c$b;->i(I)LM0/c$b;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget v1, p0, LL0/n$b;->q:F

    .line 69
    .line 70
    invoke-virtual {v0, v1}, LM0/c$b;->r(F)LM0/c$b;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget v1, p0, LL0/n$b;->r:F

    .line 75
    .line 76
    invoke-virtual {v0, v1}, LM0/c$b;->s(F)LM0/c$b;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget v1, p0, LL0/n$b;->o:I

    .line 81
    .line 82
    invoke-virtual {v0, v1}, LM0/c$b;->o(I)LM0/c$b;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget v1, p0, LL0/n$b;->p:I

    .line 87
    .line 88
    invoke-virtual {v0, v1}, LM0/c$b;->p(I)LM0/c$b;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget v1, p0, LL0/n$b;->s:F

    .line 93
    .line 94
    invoke-virtual {v0, v1}, LM0/c$b;->m(F)LM0/c$b;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget v1, p0, LL0/n$b;->t:F

    .line 99
    .line 100
    invoke-virtual {v0, v1}, LM0/c$b;->n(F)LM0/c$b;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iget v1, p0, LL0/n$b;->u:F

    .line 105
    .line 106
    invoke-virtual {v0, v1}, LM0/c$b;->b(F)LM0/c$b;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iget v1, p0, LL0/n$b;->w:I

    .line 111
    .line 112
    invoke-virtual {v0, v1}, LM0/c$b;->t(I)LM0/c$b;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iget-boolean v1, p0, LL0/n$b;->x:Z

    .line 117
    .line 118
    invoke-virtual {v0, v1}, LM0/c$b;->v(Z)LM0/c$b;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iget v1, p0, LL0/n$b;->v:F

    .line 123
    .line 124
    invoke-virtual {v0, v1}, LM0/c$b;->f(F)LM0/c$b;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iget-boolean v1, p0, LL0/n$b;->y:Z

    .line 129
    .line 130
    invoke-virtual {v0, v1}, LM0/c$b;->d(Z)LM0/c$b;

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, LL0/n$b;->A:LL0/n$b;

    .line 134
    .line 135
    const/4 v1, 0x0

    .line 136
    :goto_0
    iget v2, p0, LL0/n$b;->z:I

    .line 137
    .line 138
    if-ge v1, v2, :cond_1

    .line 139
    .line 140
    if-eqz v0, :cond_1

    .line 141
    .line 142
    invoke-static {}, LM0/c;->w()LM0/c$b;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    invoke-virtual {v0, p1, p2, v2}, LL0/n$b;->b(LL0/n$a;Ljava/util/ArrayList;LM0/c$b;)LL0/n$b;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {p3, v2}, LM0/c$b;->a(LM0/c$b;)LM0/c$b;

    .line 151
    .line 152
    .line 153
    add-int/lit8 v1, v1, 0x1

    .line 154
    .line 155
    goto :goto_0

    .line 156
    :cond_1
    return-object v0
.end method

.method public c(Landroid/view/View;)V
    .locals 1

    .line 1
    iput-object p1, p0, LL0/n$b;->g:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, LL0/n$b;->k:I

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, LL0/n$b;->l:I

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, LL0/n$b;->m:I

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput v0, p0, LL0/n$b;->n:I

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/View;->getScrollX()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iput v0, p0, LL0/n$b;->o:I

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput v0, p0, LL0/n$b;->p:I

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iput v0, p0, LL0/n$b;->q:F

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iput v0, p0, LL0/n$b;->r:F

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/view/View;->getScaleX()F

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iput v0, p0, LL0/n$b;->s:F

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/view/View;->getScaleY()F

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    iput v0, p0, LL0/n$b;->t:F

    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iput v0, p0, LL0/n$b;->u:F

    .line 68
    .line 69
    invoke-virtual {p1}, Landroid/view/View;->getElevation()F

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    iput v0, p0, LL0/n$b;->v:F

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    iput v0, p0, LL0/n$b;->w:I

    .line 80
    .line 81
    invoke-virtual {p1}, Landroid/view/View;->willNotDraw()Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    iput-boolean p1, p0, LL0/n$b;->x:Z

    .line 86
    .line 87
    return-void
.end method

.method public d(LL0/n$b;)V
    .locals 1

    .line 1
    iget-object v0, p0, LL0/n$b;->h:Ljava/lang/Class;

    .line 2
    .line 3
    iput-object v0, p1, LL0/n$b;->h:Ljava/lang/Class;

    .line 4
    .line 5
    iget v0, p0, LL0/n$b;->i:I

    .line 6
    .line 7
    iput v0, p1, LL0/n$b;->i:I

    .line 8
    .line 9
    iget v0, p0, LL0/n$b;->z:I

    .line 10
    .line 11
    iput v0, p1, LL0/n$b;->z:I

    .line 12
    .line 13
    iget v0, p0, LL0/n$b;->j:I

    .line 14
    .line 15
    iput v0, p1, LL0/n$b;->j:I

    .line 16
    .line 17
    iget v0, p0, LL0/n$b;->k:I

    .line 18
    .line 19
    iput v0, p1, LL0/n$b;->k:I

    .line 20
    .line 21
    iget v0, p0, LL0/n$b;->l:I

    .line 22
    .line 23
    iput v0, p1, LL0/n$b;->l:I

    .line 24
    .line 25
    iget v0, p0, LL0/n$b;->m:I

    .line 26
    .line 27
    iput v0, p1, LL0/n$b;->m:I

    .line 28
    .line 29
    iget v0, p0, LL0/n$b;->n:I

    .line 30
    .line 31
    iput v0, p1, LL0/n$b;->n:I

    .line 32
    .line 33
    iget v0, p0, LL0/n$b;->o:I

    .line 34
    .line 35
    iput v0, p1, LL0/n$b;->o:I

    .line 36
    .line 37
    iget v0, p0, LL0/n$b;->p:I

    .line 38
    .line 39
    iput v0, p1, LL0/n$b;->p:I

    .line 40
    .line 41
    iget v0, p0, LL0/n$b;->s:F

    .line 42
    .line 43
    iput v0, p1, LL0/n$b;->s:F

    .line 44
    .line 45
    iget v0, p0, LL0/n$b;->t:F

    .line 46
    .line 47
    iput v0, p1, LL0/n$b;->t:F

    .line 48
    .line 49
    iget v0, p0, LL0/n$b;->q:F

    .line 50
    .line 51
    iput v0, p1, LL0/n$b;->q:F

    .line 52
    .line 53
    iget v0, p0, LL0/n$b;->r:F

    .line 54
    .line 55
    iput v0, p1, LL0/n$b;->r:F

    .line 56
    .line 57
    iget v0, p0, LL0/n$b;->u:F

    .line 58
    .line 59
    iput v0, p1, LL0/n$b;->u:F

    .line 60
    .line 61
    iget v0, p0, LL0/n$b;->w:I

    .line 62
    .line 63
    iput v0, p1, LL0/n$b;->w:I

    .line 64
    .line 65
    iget-boolean v0, p0, LL0/n$b;->x:Z

    .line 66
    .line 67
    iput-boolean v0, p1, LL0/n$b;->x:Z

    .line 68
    .line 69
    iget-boolean v0, p0, LL0/n$b;->y:Z

    .line 70
    .line 71
    iput-boolean v0, p1, LL0/n$b;->y:Z

    .line 72
    .line 73
    iget p0, p0, LL0/n$b;->v:F

    .line 74
    .line 75
    iput p0, p1, LL0/n$b;->v:F

    .line 76
    .line 77
    return-void
.end method

.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, LL0/n$b;->B:Ljava/util/function/Consumer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-object v1, p0, LL0/n$b;->B:Ljava/util/function/Consumer;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
