.class public final Lu2/c$a$a;
.super Ljava/lang/Object;
.source "ActivityTransitionAnimator.kt"

# interfaces
.implements Lu2/c$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lu2/c$a;->u(Landroid/view/RemoteAnimationTarget;Landroid/view/RemoteAnimationTarget;ZLandroid/window/WindowAnimationState;Landroid/view/SurfaceControl$Transaction;Landroid/view/IRemoteAnimationFinishedCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field private final synthetic b:Lu2/c$d;

.field final synthetic c:Lu2/c$d;

.field final synthetic d:Lu2/c$a;

.field final synthetic e:Z

.field final synthetic f:Landroid/window/WindowAnimationState;

.field final synthetic g:Landroid/graphics/Rect;

.field final synthetic h:Landroid/view/SurfaceControl$Transaction;

.field final synthetic i:Landroid/view/RemoteAnimationTarget;

.field final synthetic j:Z

.field final synthetic k:Landroid/view/ViewRootImpl;

.field final synthetic l:Landroid/view/IRemoteAnimationFinishedCallback;

.field final synthetic m:Landroid/view/RemoteAnimationTarget;


# direct methods
.method constructor <init>(Lu2/c$d;Lu2/c$a;ZLandroid/window/WindowAnimationState;Landroid/graphics/Rect;Landroid/view/SurfaceControl$Transaction;Landroid/view/RemoteAnimationTarget;ZLandroid/view/ViewRootImpl;Landroid/view/IRemoteAnimationFinishedCallback;Landroid/view/RemoteAnimationTarget;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lu2/c$a$a;->c:Lu2/c$d;

    .line 2
    .line 3
    iput-object p2, p0, Lu2/c$a$a;->d:Lu2/c$a;

    .line 4
    .line 5
    iput-boolean p3, p0, Lu2/c$a$a;->e:Z

    .line 6
    .line 7
    iput-object p4, p0, Lu2/c$a$a;->f:Landroid/window/WindowAnimationState;

    .line 8
    .line 9
    iput-object p5, p0, Lu2/c$a$a;->g:Landroid/graphics/Rect;

    .line 10
    .line 11
    iput-object p6, p0, Lu2/c$a$a;->h:Landroid/view/SurfaceControl$Transaction;

    .line 12
    .line 13
    iput-object p7, p0, Lu2/c$a$a;->i:Landroid/view/RemoteAnimationTarget;

    .line 14
    .line 15
    iput-boolean p8, p0, Lu2/c$a$a;->j:Z

    .line 16
    .line 17
    iput-object p9, p0, Lu2/c$a$a;->k:Landroid/view/ViewRootImpl;

    .line 18
    .line 19
    iput-object p10, p0, Lu2/c$a$a;->l:Landroid/view/IRemoteAnimationFinishedCallback;

    .line 20
    .line 21
    iput-object p11, p0, Lu2/c$a$a;->m:Landroid/view/RemoteAnimationTarget;

    .line 22
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lu2/c$a$a;->b:Lu2/c$d;

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public a()Landroid/window/WindowAnimationState;
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/c$a$a;->b:Lu2/c$d;

    .line 2
    .line 3
    invoke-interface {p0}, Lu2/F$c;->a()Landroid/window/WindowAnimationState;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/c$a$a;->b:Lu2/c$d;

    .line 2
    .line 3
    invoke-interface {p0}, Lu2/c$d;->b()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/c$a$a;->b:Lu2/c$d;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lu2/c$d;->c(Ljava/lang/Boolean;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/c$a$a;->b:Lu2/c$d;

    .line 2
    .line 3
    invoke-interface {p0}, Lu2/F$c;->d()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e()Lu2/F$k;
    .locals 10

    .line 1
    invoke-virtual {p0}, Lu2/c$a$a;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lu2/c$a$a;->c:Lu2/c$d;

    .line 8
    .line 9
    invoke-interface {p0}, Lu2/F$c;->e()Lu2/F$k;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    sget-object v0, Lu2/F;->i:Lu2/F$b;

    .line 15
    .line 16
    invoke-virtual {v0}, Lu2/F$b;->h()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_3

    .line 21
    .line 22
    iget-object v1, p0, Lu2/c$a$a;->c:Lu2/c$d;

    .line 23
    .line 24
    invoke-interface {v1}, Lu2/F$c;->a()Landroid/window/WindowAnimationState;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lu2/F$b;->j(Landroid/window/WindowAnimationState;)Lu2/F$k;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    return-object v0

    .line 38
    :cond_2
    :goto_0
    iget-object v0, p0, Lu2/c$a$a;->d:Lu2/c$a;

    .line 39
    .line 40
    iget-boolean v1, p0, Lu2/c$a$a;->e:Z

    .line 41
    .line 42
    invoke-static {v0, v1}, Lu2/c$a;->f(Lu2/c$a;Z)F

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    iget-object p0, p0, Lu2/c$a$a;->g:Landroid/graphics/Rect;

    .line 47
    .line 48
    new-instance v2, Lu2/F$k;

    .line 49
    .line 50
    iget v3, p0, Landroid/graphics/Rect;->top:I

    .line 51
    .line 52
    iget v4, p0, Landroid/graphics/Rect;->bottom:I

    .line 53
    .line 54
    iget v5, p0, Landroid/graphics/Rect;->left:I

    .line 55
    .line 56
    iget v6, p0, Landroid/graphics/Rect;->right:I

    .line 57
    .line 58
    move v8, v7

    .line 59
    invoke-direct/range {v2 .. v8}, Lu2/F$k;-><init>(IIIIFF)V

    .line 60
    .line 61
    .line 62
    return-object v2

    .line 63
    :cond_3
    iget-object v0, p0, Lu2/c$a$a;->f:Landroid/window/WindowAnimationState;

    .line 64
    .line 65
    const/4 v1, 0x0

    .line 66
    if-eqz v0, :cond_4

    .line 67
    .line 68
    iget-object v0, v0, Landroid/window/WindowAnimationState;->bounds:Landroid/graphics/RectF;

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_4
    move-object v0, v1

    .line 72
    :goto_1
    if-eqz v0, :cond_5

    .line 73
    .line 74
    iget v2, v0, Landroid/graphics/RectF;->left:F

    .line 75
    .line 76
    float-to-int v2, v2

    .line 77
    :goto_2
    move v6, v2

    .line 78
    goto :goto_3

    .line 79
    :cond_5
    iget-object v2, p0, Lu2/c$a$a;->g:Landroid/graphics/Rect;

    .line 80
    .line 81
    iget v2, v2, Landroid/graphics/Rect;->left:I

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :goto_3
    if-eqz v0, :cond_6

    .line 85
    .line 86
    iget v2, v0, Landroid/graphics/RectF;->top:F

    .line 87
    .line 88
    float-to-int v2, v2

    .line 89
    :goto_4
    move v4, v2

    .line 90
    goto :goto_5

    .line 91
    :cond_6
    iget-object v2, p0, Lu2/c$a$a;->g:Landroid/graphics/Rect;

    .line 92
    .line 93
    iget v2, v2, Landroid/graphics/Rect;->top:I

    .line 94
    .line 95
    goto :goto_4

    .line 96
    :goto_5
    if-eqz v0, :cond_7

    .line 97
    .line 98
    iget v2, v0, Landroid/graphics/RectF;->right:F

    .line 99
    .line 100
    float-to-int v2, v2

    .line 101
    :goto_6
    move v7, v2

    .line 102
    goto :goto_7

    .line 103
    :cond_7
    iget-object v2, p0, Lu2/c$a$a;->g:Landroid/graphics/Rect;

    .line 104
    .line 105
    iget v2, v2, Landroid/graphics/Rect;->right:I

    .line 106
    .line 107
    goto :goto_6

    .line 108
    :goto_7
    if-eqz v0, :cond_8

    .line 109
    .line 110
    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    .line 111
    .line 112
    float-to-int v0, v0

    .line 113
    :goto_8
    move v5, v0

    .line 114
    goto :goto_9

    .line 115
    :cond_8
    iget-object v0, p0, Lu2/c$a$a;->g:Landroid/graphics/Rect;

    .line 116
    .line 117
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 118
    .line 119
    goto :goto_8

    .line 120
    :goto_9
    iget-object v0, p0, Lu2/c$a$a;->g:Landroid/graphics/Rect;

    .line 121
    .line 122
    iget v2, v0, Landroid/graphics/Rect;->right:I

    .line 123
    .line 124
    iget v3, v0, Landroid/graphics/Rect;->left:I

    .line 125
    .line 126
    sub-int/2addr v2, v3

    .line 127
    iget v3, v0, Landroid/graphics/Rect;->bottom:I

    .line 128
    .line 129
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 130
    .line 131
    sub-int/2addr v3, v0

    .line 132
    sub-int v0, v7, v6

    .line 133
    .line 134
    int-to-float v0, v0

    .line 135
    int-to-float v2, v2

    .line 136
    div-float/2addr v0, v2

    .line 137
    sub-int v2, v5, v4

    .line 138
    .line 139
    int-to-float v2, v2

    .line 140
    int-to-float v3, v3

    .line 141
    div-float/2addr v2, v3

    .line 142
    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    iget-object v2, p0, Lu2/c$a$a;->f:Landroid/window/WindowAnimationState;

    .line 147
    .line 148
    if-eqz v2, :cond_9

    .line 149
    .line 150
    iget v1, v2, Landroid/window/WindowAnimationState;->topLeftRadius:F

    .line 151
    .line 152
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    :cond_9
    if-eqz v1, :cond_a

    .line 157
    .line 158
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    mul-float/2addr p0, v0

    .line 163
    :goto_a
    move v8, p0

    .line 164
    goto :goto_b

    .line 165
    :cond_a
    iget-object v0, p0, Lu2/c$a$a;->d:Lu2/c$a;

    .line 166
    .line 167
    iget-boolean p0, p0, Lu2/c$a$a;->e:Z

    .line 168
    .line 169
    invoke-static {v0, p0}, Lu2/c$a;->f(Lu2/c$a;Z)F

    .line 170
    .line 171
    .line 172
    move-result p0

    .line 173
    goto :goto_a

    .line 174
    :goto_b
    new-instance v3, Lu2/F$k;

    .line 175
    .line 176
    move v9, v8

    .line 177
    invoke-direct/range {v3 .. v9}, Lu2/F$k;-><init>(IIIIFF)V

    .line 178
    .line 179
    .line 180
    return-object v3
.end method

.method public f()Lu2/c$f;
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/c$a$a;->b:Lu2/c$d;

    .line 2
    .line 3
    invoke-interface {p0}, Lu2/c$d;->f()Lu2/c$f;

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0
.end method

.method public h()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/c$a$a;->b:Lu2/c$d;

    .line 2
    .line 3
    invoke-interface {p0}, Lu2/F$c;->h()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public i(Lu2/F$k;FF)V
    .locals 9

    .line 1
    const-string v0, "state"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lu2/c$a$a;->d:Lu2/c$a;

    .line 7
    .line 8
    iget-object v2, p0, Lu2/c$a$a;->i:Landroid/view/RemoteAnimationTarget;

    .line 9
    .line 10
    iget-boolean v5, p0, Lu2/c$a$a;->j:Z

    .line 11
    .line 12
    const/16 v7, 0x10

    .line 13
    .line 14
    const/4 v8, 0x0

    .line 15
    const/4 v6, 0x0

    .line 16
    move-object v3, p1

    .line 17
    move v4, p3

    .line 18
    invoke-static/range {v1 .. v8}, Lu2/c$a;->j(Lu2/c$a;Landroid/view/RemoteAnimationTarget;Lu2/F$k;FZLandroid/view/SurfaceControl$Transaction;ILjava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lu2/c$a$a;->m:Landroid/view/RemoteAnimationTarget;

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iget-object p3, p0, Lu2/c$a$a;->d:Lu2/c$a;

    .line 26
    .line 27
    invoke-static {p3, p1, v3, v4}, Lu2/c$a;->c(Lu2/c$a;Landroid/view/RemoteAnimationTarget;Lu2/F$k;F)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p1, p0, Lu2/c$a$a;->d:Lu2/c$a;

    .line 31
    .line 32
    invoke-static {p1}, Lu2/c$a;->e(Lu2/c$a;)Lu2/c$e;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-interface {p1, v4}, Lu2/c$e;->b(F)V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object p0, p0, Lu2/c$a$a;->c:Lu2/c$d;

    .line 42
    .line 43
    invoke-interface {p0, v3, p2, v4}, Lu2/F$c;->i(Lu2/F$k;FF)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public j(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lu2/c$a$a;->d:Lu2/c$a;

    .line 2
    .line 3
    invoke-static {v0}, Lu2/c$a;->e(Lu2/c$a;)Lu2/c$e;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0}, Lu2/c$e;->d()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lu2/c$a$a;->l:Landroid/view/IRemoteAnimationFinishedCallback;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Lu2/c$a$a;->d:Lu2/c$a;

    .line 17
    .line 18
    invoke-static {v1, v0}, Lu2/c$a;->g(Lu2/c$a;Landroid/view/IRemoteAnimationFinishedCallback;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    sget-boolean v0, Lu2/c;->g:Z

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Lu2/c$a$a;->c:Lu2/c$d;

    .line 26
    .line 27
    new-instance v1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v2, "Calling controller.onTransitionAnimationEnd(isExpandingFullyAbove="

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v2, ") [controller="

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v0, "]"

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const-string v1, "ActivityTransitionAnimator"

    .line 58
    .line 59
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    :cond_2
    iget-object p0, p0, Lu2/c$a$a;->c:Lu2/c$d;

    .line 63
    .line 64
    invoke-interface {p0, p1}, Lu2/F$c;->j(Z)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public l()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Lu2/c$a$a;->b:Lu2/c$d;

    .line 2
    .line 3
    invoke-interface {p0}, Lu2/F$c;->l()Landroid/view/ViewGroup;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public m(Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Lu2/c$a$a;->d:Lu2/c$a;

    .line 2
    .line 3
    invoke-static {v0}, Lu2/c$a;->e(Lu2/c$a;)Lu2/c$e;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0}, Lu2/c$e;->a()V

    .line 10
    .line 11
    .line 12
    :cond_0
    sget-boolean v0, Lu2/c;->g:Z

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lu2/c$a$a;->c:Lu2/c$d;

    .line 17
    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v2, "Calling controller.onTransitionAnimationStart(isExpandingFullyAbove="

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v2, ") [controller="

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v0, "]"

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v1, "ActivityTransitionAnimator"

    .line 49
    .line 50
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    :cond_1
    iget-object v0, p0, Lu2/c$a$a;->d:Lu2/c$a;

    .line 54
    .line 55
    invoke-virtual {v0}, Lu2/c$a;->l()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    new-instance v1, Landroid/view/SurfaceControl$Transaction;

    .line 62
    .line 63
    invoke-direct {v1}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lu2/c$a$a;->i:Landroid/view/RemoteAnimationTarget;

    .line 67
    .line 68
    iget-object v2, p0, Lu2/c$a$a;->k:Landroid/view/ViewRootImpl;

    .line 69
    .line 70
    :try_start_0
    iget-object v0, v0, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 71
    .line 72
    invoke-virtual {v2}, Landroid/view/ViewRootImpl;->getSurfaceControl()Landroid/view/SurfaceControl;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v1, v0, v2}, Landroid/view/SurfaceControl$Transaction;->reparent(Landroid/view/SurfaceControl;Landroid/view/SurfaceControl;)Landroid/view/SurfaceControl$Transaction;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 80
    .line 81
    .line 82
    sget-object v0, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 83
    .line 84
    const/4 v0, 0x0

    .line 85
    invoke-static {v1, v0}, Lr4/a;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :catchall_0
    move-exception v0

    .line 90
    move-object p0, v0

    .line 91
    :try_start_1
    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 92
    :catchall_1
    move-exception v0

    .line 93
    move-object p1, v0

    .line 94
    invoke-static {v1, p0}, Lr4/a;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 95
    .line 96
    .line 97
    throw p1

    .line 98
    :cond_2
    :goto_0
    iget-object v0, p0, Lu2/c$a$a;->h:Landroid/view/SurfaceControl$Transaction;

    .line 99
    .line 100
    if-eqz v0, :cond_3

    .line 101
    .line 102
    iget-object v1, p0, Lu2/c$a$a;->d:Lu2/c$a;

    .line 103
    .line 104
    iget-object v2, p0, Lu2/c$a$a;->i:Landroid/view/RemoteAnimationTarget;

    .line 105
    .line 106
    invoke-virtual {p0}, Lu2/c$a$a;->e()Lu2/F$k;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    iget-boolean v5, p0, Lu2/c$a$a;->j:Z

    .line 111
    .line 112
    iget-object v6, p0, Lu2/c$a$a;->h:Landroid/view/SurfaceControl$Transaction;

    .line 113
    .line 114
    const/4 v4, 0x0

    .line 115
    invoke-static/range {v1 .. v6}, Lu2/c$a;->d(Lu2/c$a;Landroid/view/RemoteAnimationTarget;Lu2/F$k;FZLandroid/view/SurfaceControl$Transaction;)V

    .line 116
    .line 117
    .line 118
    :cond_3
    iget-object p0, p0, Lu2/c$a$a;->c:Lu2/c$d;

    .line 119
    .line 120
    invoke-interface {p0, p1}, Lu2/F$c;->m(Z)V

    .line 121
    .line 122
    .line 123
    return-void
.end method
