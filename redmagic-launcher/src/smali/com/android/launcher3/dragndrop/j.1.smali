.class public abstract Lcom/android/launcher3/dragndrop/j;
.super Ljava/lang/Object;
.source "DragController.java"

# interfaces
.implements Lcom/android/launcher3/dragndrop/k$a;
.implements Lcom/android/launcher3/util/G2;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/dragndrop/j$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/dragndrop/k$a;",
        "Lcom/android/launcher3/util/G2;"
    }
.end annotation


# instance fields
.field protected final g:Lcom/android/launcher3/views/k;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final h:Landroid/graphics/Rect;

.field private final i:[I

.field protected j:Lcom/android/launcher3/dragndrop/k;

.field public k:Lcom/android/launcher3/dragndrop/p;

.field protected final l:Landroid/graphics/Point;

.field protected final m:Landroid/graphics/Point;

.field protected final n:Landroid/graphics/Point;

.field public o:Lcom/android/launcher3/n0$a;

.field private final p:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/n0;",
            ">;"
        }
    .end annotation
.end field

.field private final q:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/dragndrop/j$b;",
            ">;"
        }
    .end annotation
.end field

.field protected r:Lcom/android/launcher3/n0;

.field private s:I

.field protected t:I

.field protected u:Z

.field private final v:I

.field private w:Z


# direct methods
.method public constructor <init>(Lcom/android/launcher3/views/k;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/j;->h:Landroid/graphics/Rect;

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    new-array v0, v0, [I

    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/j;->i:[I

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/j;->j:Lcom/android/launcher3/dragndrop/k;

    .line 18
    .line 19
    new-instance v0, Landroid/graphics/Point;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/j;->l:Landroid/graphics/Point;

    .line 25
    .line 26
    new-instance v0, Landroid/graphics/Point;

    .line 27
    .line 28
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/j;->m:Landroid/graphics/Point;

    .line 32
    .line 33
    new-instance v0, Landroid/graphics/Point;

    .line 34
    .line 35
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/j;->n:Landroid/graphics/Point;

    .line 39
    .line 40
    new-instance v0, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/j;->p:Ljava/util/ArrayList;

    .line 46
    .line 47
    new-instance v0, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/j;->q:Ljava/util/ArrayList;

    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    iput v0, p0, Lcom/android/launcher3/dragndrop/j;->t:I

    .line 56
    .line 57
    const/16 v1, 0x1f4

    .line 58
    .line 59
    iput v1, p0, Lcom/android/launcher3/dragndrop/j;->v:I

    .line 60
    .line 61
    iput-boolean v0, p0, Lcom/android/launcher3/dragndrop/j;->w:Z

    .line 62
    .line 63
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 64
    .line 65
    return-void
.end method

.method private J()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 8
    .line 9
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->q0:Z

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 15
    .line 16
    instance-of v2, v0, Lcom/android/launcher3/C2;

    .line 17
    .line 18
    if-eqz v2, :cond_3

    .line 19
    .line 20
    check-cast v0, Lcom/android/launcher3/C2;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->y0()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    sget-object v0, Lx1/O;->h:Landroid/content/ComponentName;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    sget-object v0, Lx1/O;->g:Landroid/content/ComponentName;

    .line 40
    .line 41
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 42
    .line 43
    check-cast v2, Lcom/android/launcher3/C2;

    .line 44
    .line 45
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    if-eqz v2, :cond_3

    .line 50
    .line 51
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 52
    .line 53
    iget-object v2, v2, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 54
    .line 55
    if-eqz v2, :cond_3

    .line 56
    .line 57
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v0, v2}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_3

    .line 66
    .line 67
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 70
    .line 71
    iget v0, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 72
    .line 73
    const/16 v2, -0x65

    .line 74
    .line 75
    if-ne v0, v2, :cond_3

    .line 76
    .line 77
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 78
    .line 79
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    const/4 v2, 0x1

    .line 88
    if-eqz v0, :cond_2

    .line 89
    .line 90
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 91
    .line 92
    iget-object v0, v0, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 93
    .line 94
    iget v0, v0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 95
    .line 96
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 97
    .line 98
    check-cast p0, Lcom/android/launcher3/C2;

    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    sub-int/2addr p0, v2

    .line 109
    if-ne v0, p0, :cond_1

    .line 110
    .line 111
    return v2

    .line 112
    :cond_1
    return v1

    .line 113
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 116
    .line 117
    iget v0, v0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 118
    .line 119
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 120
    .line 121
    check-cast p0, Lcom/android/launcher3/C2;

    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    sub-int/2addr p0, v2

    .line 132
    if-ne v0, p0, :cond_3

    .line 133
    .line 134
    return v2

    .line 135
    :cond_3
    return v1
.end method

.method private S()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    const/high16 v0, 0x30000000

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/android/launcher3/a;->getTopOpenViewWithType(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    instance-of v0, p0, Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    instance-of v0, p0, Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    :cond_0
    const-string v0, "DragController"

    .line 20
    .line 21
    const-string v1, "updateFloatViewState: resetTouchEvent"

    .line 22
    .line 23
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    check-cast p0, Lcom/android/launcher3/widget/o;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/widget/o;->P0()V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public static synthetic f(Lcom/android/launcher3/n0$a;)Lcom/android/launcher3/logging/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/n0$a;->n:Lcom/android/launcher3/logging/d;

    .line 2
    .line 3
    return-object p0
.end method

.method private m(II)Lcom/android/launcher3/n0;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/dragndrop/j;->u:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->r:Lcom/android/launcher3/n0;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/dragndrop/j;->u(II)Lcom/android/launcher3/n0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_6

    .line 13
    .line 14
    iget-object p2, p0, Lcom/android/launcher3/dragndrop/j;->r:Lcom/android/launcher3/n0;

    .line 15
    .line 16
    if-eq p2, p1, :cond_5

    .line 17
    .line 18
    if-eqz p2, :cond_3

    .line 19
    .line 20
    instance-of v0, p2, Lcom/android/launcher3/Workspace;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    instance-of v0, p1, Lcom/android/launcher3/ButtonDropTarget;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    check-cast p2, Lcom/android/launcher3/Workspace;

    .line 29
    .line 30
    invoke-virtual {p2}, Lcom/android/launcher3/Workspace;->M2()V

    .line 31
    .line 32
    .line 33
    :cond_1
    instance-of p2, p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 34
    .line 35
    if-eqz p2, :cond_2

    .line 36
    .line 37
    move-object p2, p1

    .line 38
    check-cast p2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    invoke-virtual {p2, v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->setDragFromOtherTarget(Z)V

    .line 42
    .line 43
    .line 44
    :cond_2
    iget-object p2, p0, Lcom/android/launcher3/dragndrop/j;->r:Lcom/android/launcher3/n0;

    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 47
    .line 48
    invoke-interface {p2, v0}, Lcom/android/launcher3/n0;->J(Lcom/android/launcher3/n0$a;)V

    .line 49
    .line 50
    .line 51
    :cond_3
    iget-object p2, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 52
    .line 53
    invoke-interface {p1, p2}, Lcom/android/launcher3/n0;->l(Lcom/android/launcher3/n0$a;)V

    .line 54
    .line 55
    .line 56
    new-instance p2, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .line 60
    .line 61
    const-string v0, "checkTouchMove--drop--onDragEnter in: "

    .line 62
    .line 63
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v0, " onDragExit from : "

    .line 74
    .line 75
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->r:Lcom/android/launcher3/n0;

    .line 79
    .line 80
    if-eqz v0, :cond_4

    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    goto :goto_0

    .line 87
    :cond_4
    const-string v0, ""

    .line 88
    .line 89
    :goto_0
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    const-string v0, "DragController"

    .line 97
    .line 98
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    :cond_5
    iget-object p2, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 102
    .line 103
    invoke-interface {p1, p2}, Lcom/android/launcher3/n0;->G(Lcom/android/launcher3/n0$a;)V

    .line 104
    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_6
    iget-object p2, p0, Lcom/android/launcher3/dragndrop/j;->r:Lcom/android/launcher3/n0;

    .line 108
    .line 109
    if-eqz p2, :cond_7

    .line 110
    .line 111
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 112
    .line 113
    invoke-interface {p2, v0}, Lcom/android/launcher3/n0;->J(Lcom/android/launcher3/n0$a;)V

    .line 114
    .line 115
    .line 116
    :cond_7
    :goto_1
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/j;->r:Lcom/android/launcher3/n0;

    .line 117
    .line 118
    return-object p1
.end method

.method private o(Landroid/view/View;Z)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "dispatchDropComplete accepted:"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "DragController"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    if-nez p2, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->t()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    iput-boolean v2, v0, Lcom/android/launcher3/n0$a;->k:Z

    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 34
    .line 35
    iget-object v2, v0, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 36
    .line 37
    invoke-interface {v2, p1, v0, p2}, Lcom/android/launcher3/m0;->r(Landroid/view/View;Lcom/android/launcher3/n0$a;Z)V

    .line 38
    .line 39
    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/j;->S()V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    const-string p0, "dispatchDropComplete dropTarget is null"

    .line 47
    .line 48
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method private u(II)Lcom/android/launcher3/n0;
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->i:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aput p1, v0, v1

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    aput p2, v0, v2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->h:Landroid/graphics/Rect;

    .line 10
    .line 11
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/j;->p:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    sub-int/2addr v4, v2

    .line 18
    :goto_0
    if-ltz v4, :cond_5

    .line 19
    .line 20
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    check-cast v5, Lcom/android/launcher3/n0;

    .line 25
    .line 26
    instance-of v6, v5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 27
    .line 28
    if-eqz v6, :cond_2

    .line 29
    .line 30
    move-object v6, v5

    .line 31
    check-cast v6, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 32
    .line 33
    iget-object v7, v6, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 34
    .line 35
    const/16 v8, 0x20

    .line 36
    .line 37
    invoke-virtual {v7, v8}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 38
    .line 39
    .line 40
    move-result v7

    .line 41
    if-eqz v7, :cond_0

    .line 42
    .line 43
    iget-object v7, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 44
    .line 45
    iget-object v7, v7, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 46
    .line 47
    iget v7, v7, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 48
    .line 49
    const/4 v8, 0x6

    .line 50
    if-eq v7, v8, :cond_4

    .line 51
    .line 52
    if-eq v7, v2, :cond_4

    .line 53
    .line 54
    sget-object v7, Lx1/Y;->c:[Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 57
    .line 58
    .line 59
    move-result-object v7

    .line 60
    iget-object v8, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 61
    .line 62
    iget-object v8, v8, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 63
    .line 64
    invoke-virtual {v8}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v8

    .line 68
    invoke-interface {v7, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v7

    .line 72
    if-eqz v7, :cond_0

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_0
    iget-object v7, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 76
    .line 77
    invoke-virtual {v6, v7}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->f1(Lcom/android/launcher3/n0$a;)Z

    .line 78
    .line 79
    .line 80
    move-result v7

    .line 81
    if-nez v7, :cond_1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getTag()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    instance-of v7, v6, Lcom/android/launcher3/model/data/y;

    .line 89
    .line 90
    if-eqz v7, :cond_3

    .line 91
    .line 92
    check-cast v6, Lcom/android/launcher3/model/data/y;

    .line 93
    .line 94
    iget v6, v6, Lcom/android/launcher3/model/data/y;->container:I

    .line 95
    .line 96
    const/16 v7, -0x65

    .line 97
    .line 98
    if-ne v6, v7, :cond_3

    .line 99
    .line 100
    iget-object v6, p0, Lcom/android/launcher3/dragndrop/j;->r:Lcom/android/launcher3/n0;

    .line 101
    .line 102
    instance-of v7, v6, Lcom/android/launcher3/Workspace;

    .line 103
    .line 104
    if-eqz v7, :cond_3

    .line 105
    .line 106
    check-cast v6, Lcom/android/launcher3/Workspace;

    .line 107
    .line 108
    invoke-virtual {v6}, Lcom/android/launcher3/Workspace;->s1()Z

    .line 109
    .line 110
    .line 111
    move-result v6

    .line 112
    if-nez v6, :cond_3

    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_2
    invoke-interface {v5}, Lcom/android/launcher3/n0;->D()Z

    .line 116
    .line 117
    .line 118
    move-result v6

    .line 119
    if-nez v6, :cond_3

    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_3
    invoke-interface {v5, v0}, Lcom/android/launcher3/n0;->b(Landroid/graphics/Rect;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    .line 126
    .line 127
    .line 128
    move-result v6

    .line 129
    if-eqz v6, :cond_4

    .line 130
    .line 131
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 132
    .line 133
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-interface {v5}, Lcom/android/launcher3/n0;->getDropView()Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->i:[I

    .line 142
    .line 143
    invoke-virtual {p1, p2, v0}, Lcom/android/launcher3/views/BaseDragLayer;->mapCoordInSelfToDescendant(Landroid/view/View;[I)V

    .line 144
    .line 145
    .line 146
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 147
    .line 148
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->i:[I

    .line 149
    .line 150
    aget p2, p0, v1

    .line 151
    .line 152
    iput p2, p1, Lcom/android/launcher3/n0$a;->a:I

    .line 153
    .line 154
    aget p0, p0, v2

    .line 155
    .line 156
    iput p0, p1, Lcom/android/launcher3/n0$a;->b:I

    .line 157
    .line 158
    return-object v5

    .line 159
    :cond_4
    :goto_1
    add-int/lit8 v4, v4, -0x1

    .line 160
    .line 161
    goto/16 :goto_0

    .line 162
    .line 163
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/j;->i:[I

    .line 164
    .line 165
    invoke-virtual {p0, p1}, Lcom/android/launcher3/dragndrop/j;->x([I)Lcom/android/launcher3/n0;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    iget-object p2, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 170
    .line 171
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->i:[I

    .line 172
    .line 173
    aget v0, p0, v1

    .line 174
    .line 175
    iput v0, p2, Lcom/android/launcher3/n0$a;->a:I

    .line 176
    .line 177
    aget p0, p0, v2

    .line 178
    .line 179
    iput p0, p2, Lcom/android/launcher3/n0$a;->b:I

    .line 180
    .line 181
    return-object p1
.end method


# virtual methods
.method public A()Landroid/graphics/Point;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->m:Landroid/graphics/Point;

    .line 2
    .line 3
    return-object p0
.end method

.method public B()Ljava/util/Optional;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Optional<",
            "Lcom/android/launcher3/logging/d;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Lcom/android/launcher3/dragndrop/i;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/android/launcher3/dragndrop/i;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ljava/util/Optional;->map(Ljava/util/function/Function;)Ljava/util/Optional;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public C()Lcom/android/launcher3/dragndrop/p;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 2
    .line 3
    return-object p0
.end method

.method protected D(Landroid/view/MotionEvent;)F
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method protected E(Landroid/view/MotionEvent;)F
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method protected F(II)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/dragndrop/v;->B(II)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lcom/android/launcher3/dragndrop/j;->t:I

    .line 9
    .line 10
    int-to-double v0, v0

    .line 11
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/j;->m:Landroid/graphics/Point;

    .line 12
    .line 13
    iget v3, v2, Landroid/graphics/Point;->x:I

    .line 14
    .line 15
    sub-int/2addr v3, p1

    .line 16
    int-to-double v3, v3

    .line 17
    iget v2, v2, Landroid/graphics/Point;->y:I

    .line 18
    .line 19
    sub-int/2addr v2, p2

    .line 20
    int-to-double v5, v2

    .line 21
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->hypot(DD)D

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    add-double/2addr v0, v2

    .line 26
    double-to-int v0, v0

    .line 27
    iput v0, p0, Lcom/android/launcher3/dragndrop/j;->t:I

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->m:Landroid/graphics/Point;

    .line 30
    .line 31
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Point;->set(II)V

    .line 32
    .line 33
    .line 34
    iget v0, p0, Lcom/android/launcher3/dragndrop/j;->t:I

    .line 35
    .line 36
    iget v1, p0, Lcom/android/launcher3/dragndrop/j;->s:I

    .line 37
    .line 38
    const/4 v2, 0x2

    .line 39
    if-ne v1, v2, :cond_0

    .line 40
    .line 41
    div-int/lit8 v0, v0, 0x3

    .line 42
    .line 43
    :cond_0
    iget-boolean v1, p0, Lcom/android/launcher3/dragndrop/j;->u:Z

    .line 44
    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 48
    .line 49
    iget-object v1, v1, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 50
    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    int-to-double v3, v0

    .line 54
    invoke-interface {v1, v3, v4}, Lcom/android/launcher3/dragndrop/p$a;->a(D)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 61
    .line 62
    instance-of v1, v0, Lcom/android/launcher3/C2;

    .line 63
    .line 64
    if-eqz v1, :cond_2

    .line 65
    .line 66
    check-cast v0, Lcom/android/launcher3/C2;

    .line 67
    .line 68
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 69
    .line 70
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_2

    .line 75
    .line 76
    invoke-static {v0, v2}, Lcom/android/launcher3/a;->hasOpenView(Lcom/android/launcher3/views/k;I)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_2

    .line 81
    .line 82
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->k()V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 87
    .line 88
    iget-object v0, v0, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 89
    .line 90
    if-eqz v0, :cond_4

    .line 91
    .line 92
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/v;->getContentView()Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    instance-of v0, v0, Lcom/android/launcher3/widget/T;

    .line 97
    .line 98
    if-eqz v0, :cond_4

    .line 99
    .line 100
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 101
    .line 102
    iget-object v0, v0, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 103
    .line 104
    if-eqz v0, :cond_3

    .line 105
    .line 106
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 107
    .line 108
    const/4 v2, 0x1

    .line 109
    invoke-interface {v0, v1, v2}, Lcom/android/launcher3/dragndrop/p$a;->c(Lcom/android/launcher3/n0$a;Z)V

    .line 110
    .line 111
    .line 112
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 113
    .line 114
    iget-object v0, v0, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/v;->C()V

    .line 117
    .line 118
    .line 119
    :cond_4
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/dragndrop/j;->m(II)Lcom/android/launcher3/n0;

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public G()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->j:Lcom/android/launcher3/dragndrop/k;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/android/launcher3/dragndrop/p;->a:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public H()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/dragndrop/j;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method protected I()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->y0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 10
    .line 11
    instance-of v0, p0, Lcom/android/launcher3/model/data/z;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    check-cast p0, Lcom/android/launcher3/model/data/z;

    .line 16
    .line 17
    iget p0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 18
    .line 19
    and-int/lit16 p0, p0, 0x2000

    .line 20
    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method public K(Ljava/util/function/Predicate;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, v0, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    instance-of v1, v0, Lcom/android/launcher3/model/data/I;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-interface {p1, v0}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    :cond_0
    instance-of v1, v0, Lcom/android/launcher3/model/data/l;

    .line 18
    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    check-cast v0, Lcom/android/launcher3/model/data/l;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Lcom/android/launcher3/model/data/m;->w(Ljava/util/function/Predicate;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_2

    .line 28
    .line 29
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->l()V

    .line 30
    .line 31
    .line 32
    :cond_2
    return-void
.end method

.method public L(Lcom/android/launcher3/dragndrop/v;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/dragndrop/v;->D()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 5
    .line 6
    instance-of v0, p1, Lcom/android/launcher3/C2;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    check-cast p1, Lcom/android/launcher3/C2;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Lcom/android/launcher3/G4;->q()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-object v0, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 26
    .line 27
    :cond_0
    const-string p1, "DragController"

    .line 28
    .line 29
    const-string v0, "onDeferredEndDrag"

    .line 30
    .line 31
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 35
    .line 36
    iget-boolean p1, p1, Lcom/android/launcher3/n0$a;->k:Z

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->j()V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 44
    .line 45
    instance-of p1, p0, Lcom/android/launcher3/C2;

    .line 46
    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    check-cast p0, Lcom/android/launcher3/C2;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const/4 p1, 0x0

    .line 56
    invoke-virtual {p0, p1}, Lcom/android/launcher3/G4;->g(Z)V

    .line 57
    .line 58
    .line 59
    :cond_1
    return-void
.end method

.method public M(Landroid/view/DragEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->j:Lcom/android/launcher3/dragndrop/k;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/dragndrop/k;->b(Landroid/view/DragEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

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

.method public N(Lcom/android/launcher3/dragndrop/j$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->q:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public O(Lcom/android/launcher3/n0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->p:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected abstract P(Landroid/graphics/drawable/Drawable;Landroid/view/View;Lcom/android/launcher3/dragndrop/y;IILcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Landroid/graphics/Rect;FFLcom/android/launcher3/dragndrop/p;)Lcom/android/launcher3/dragndrop/v;
.end method

.method public Q(Landroid/graphics/drawable/Drawable;Lcom/android/launcher3/dragndrop/y;IILcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Landroid/graphics/Rect;FFLcom/android/launcher3/dragndrop/p;)Lcom/android/launcher3/dragndrop/v;
    .locals 12

    .line 1
    const/4 v2, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v3, p2

    .line 5
    move v4, p3

    .line 6
    move/from16 v5, p4

    .line 7
    .line 8
    move-object/from16 v6, p5

    .line 9
    .line 10
    move-object/from16 v7, p6

    .line 11
    .line 12
    move-object/from16 v8, p7

    .line 13
    .line 14
    move/from16 v9, p8

    .line 15
    .line 16
    move/from16 v10, p9

    .line 17
    .line 18
    move-object/from16 v11, p10

    .line 19
    .line 20
    invoke-virtual/range {v0 .. v11}, Lcom/android/launcher3/dragndrop/j;->P(Landroid/graphics/drawable/Drawable;Landroid/view/View;Lcom/android/launcher3/dragndrop/y;IILcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Landroid/graphics/Rect;FFLcom/android/launcher3/dragndrop/p;)Lcom/android/launcher3/dragndrop/v;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public R(Landroid/view/View;Lcom/android/launcher3/dragndrop/y;IILcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Landroid/graphics/Rect;FFLcom/android/launcher3/dragndrop/p;)Lcom/android/launcher3/dragndrop/v;
    .locals 12

    .line 1
    const/4 v1, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v2, p1

    .line 4
    move-object v3, p2

    .line 5
    move v4, p3

    .line 6
    move/from16 v5, p4

    .line 7
    .line 8
    move-object/from16 v6, p5

    .line 9
    .line 10
    move-object/from16 v7, p6

    .line 11
    .line 12
    move-object/from16 v8, p7

    .line 13
    .line 14
    move/from16 v9, p8

    .line 15
    .line 16
    move/from16 v10, p9

    .line 17
    .line 18
    move-object/from16 v11, p10

    .line 19
    .line 20
    invoke-virtual/range {v0 .. v11}, Lcom/android/launcher3/dragndrop/j;->P(Landroid/graphics/drawable/Drawable;Landroid/view/View;Lcom/android/launcher3/dragndrop/y;IILcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Landroid/graphics/Rect;FFLcom/android/launcher3/dragndrop/p;)Lcom/android/launcher3/dragndrop/v;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public b(FF)V
    .locals 5

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/dragndrop/j;->w(FF)Landroid/graphics/Point;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 6
    .line 7
    instance-of v0, p2, Lcom/android/launcher3/C2;

    .line 8
    .line 9
    if-eqz v0, :cond_5

    .line 10
    .line 11
    check-cast p2, Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->u2()Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    const/4 v0, 0x1

    .line 18
    const/4 v1, 0x0

    .line 19
    if-nez p2, :cond_1

    .line 20
    .line 21
    iget-object p2, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 22
    .line 23
    check-cast p2, Lcom/android/launcher3/C2;

    .line 24
    .line 25
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->v2()Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-nez p2, :cond_1

    .line 30
    .line 31
    iget-object p2, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 32
    .line 33
    check-cast p2, Lcom/android/launcher3/C2;

    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    iget-boolean p2, p2, Lcom/android/launcher3/h0;->O0:Z

    .line 40
    .line 41
    if-eqz p2, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    move p2, v1

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    :goto_0
    move p2, v0

    .line 47
    :goto_1
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 48
    .line 49
    iget-object v3, v2, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 50
    .line 51
    instance-of v4, v3, Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 52
    .line 53
    if-nez v4, :cond_4

    .line 54
    .line 55
    instance-of v4, v3, Lcom/android/launcher3/dragndrop/K;

    .line 56
    .line 57
    if-nez v4, :cond_4

    .line 58
    .line 59
    instance-of v4, v3, Lcom/android/launcher3/allapps/r;

    .line 60
    .line 61
    if-nez v4, :cond_4

    .line 62
    .line 63
    iget-object v2, v2, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 64
    .line 65
    iget v2, v2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 66
    .line 67
    const/4 v4, 0x4

    .line 68
    if-eq v2, v4, :cond_2

    .line 69
    .line 70
    const/4 v4, 0x6

    .line 71
    if-ne v2, v4, :cond_3

    .line 72
    .line 73
    :cond_2
    instance-of v2, v3, Lcom/android/launcher3/Workspace;

    .line 74
    .line 75
    if-nez v2, :cond_3

    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_3
    move v0, v1

    .line 79
    :cond_4
    :goto_2
    if-eqz p2, :cond_5

    .line 80
    .line 81
    if-nez v0, :cond_5

    .line 82
    .line 83
    return-void

    .line 84
    :cond_5
    invoke-direct {p0}, Lcom/android/launcher3/dragndrop/j;->J()Z

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    if-eqz p2, :cond_6

    .line 89
    .line 90
    const-string p0, "DragController"

    .line 91
    .line 92
    const-string p1, "onDriverDragMove: pinned icon can not drag move."

    .line 93
    .line 94
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_6
    iget p2, p1, Landroid/graphics/Point;->x:I

    .line 99
    .line 100
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 101
    .line 102
    invoke-virtual {p0, p2, p1}, Lcom/android/launcher3/dragndrop/j;->F(II)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public c(FF)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    float-to-int p1, p1

    .line 8
    float-to-int p2, p2

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/dragndrop/j;->u(II)Lcom/android/launcher3/n0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 p2, 0x0

    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/dragndrop/j;->q(Lcom/android/launcher3/n0;Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->r()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->r:Lcom/android/launcher3/n0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Lcom/android/launcher3/n0;->J(Lcom/android/launcher3/n0$a;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/j;->r:Lcom/android/launcher3/n0;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g(Lcom/android/launcher3/dragndrop/j$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->q:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(Lcom/android/launcher3/n0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->p:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(Ljava/lang/Runnable;Landroid/view/View;I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/dragndrop/j$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Lcom/android/launcher3/dragndrop/j$a;-><init>(Lcom/android/launcher3/dragndrop/j;Landroid/view/View;Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->l:Landroid/graphics/Point;

    .line 11
    .line 12
    iget p2, p0, Landroid/graphics/Point;->x:I

    .line 13
    .line 14
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 15
    .line 16
    invoke-virtual {p1, p2, p0, v0, p3}, Lcom/android/launcher3/dragndrop/v;->m(IILjava/lang/Runnable;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method protected j()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/dragndrop/j;->u:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 13
    .line 14
    invoke-interface {v0, v2, v1}, Lcom/android/launcher3/dragndrop/p$a;->c(Lcom/android/launcher3/n0$a;Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iput-boolean v1, p0, Lcom/android/launcher3/dragndrop/j;->u:Z

    .line 18
    .line 19
    const-string v0, "DragController"

    .line 20
    .line 21
    const-string v1, "callOnDragEnd"

    .line 22
    .line 23
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 28
    .line 29
    new-instance v0, Ljava/util/ArrayList;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->q:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/android/launcher3/dragndrop/j$b;

    .line 51
    .line 52
    invoke-interface {v0}, Lcom/android/launcher3/dragndrop/j$b;->v()V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    return-void
.end method

.method protected k()V
    .locals 4

    .line 1
    const-string v0, "DragController"

    .line 2
    .line 3
    const-string v1, "callOnDragStart: in."

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-interface {v0, v1, v2}, Lcom/android/launcher3/dragndrop/p$a;->c(Lcom/android/launcher3/n0$a;Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Lcom/android/launcher3/dragndrop/j;->u:Z

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 24
    .line 25
    iget v0, v0, Lcom/android/launcher3/dragndrop/p;->e:F

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    cmpl-float v0, v0, v1

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->animate()Landroid/view/ViewPropertyAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 41
    .line 42
    iget v1, v1, Lcom/android/launcher3/dragndrop/p;->e:F

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 49
    .line 50
    iget v1, v1, Lcom/android/launcher3/dragndrop/p;->e:F

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    sget-object v1, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const-wide/16 v1, 0x1f4

    .line 63
    .line 64
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 69
    .line 70
    .line 71
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/v;->C()V

    .line 76
    .line 77
    .line 78
    new-instance v0, Ljava/util/ArrayList;

    .line 79
    .line 80
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/j;->q:Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_2

    .line 94
    .line 95
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    check-cast v1, Lcom/android/launcher3/dragndrop/j$b;

    .line 100
    .line 101
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 102
    .line 103
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 104
    .line 105
    invoke-interface {v1, v2, v3}, Lcom/android/launcher3/dragndrop/j$b;->F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_2
    return-void
.end method

.method public l()V
    .locals 5

    .line 1
    const-string v0, "DragController"

    .line 2
    .line 3
    const-string v1, "cancelDrag"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v0, :cond_5

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->r:Lcom/android/launcher3/n0;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 21
    .line 22
    invoke-interface {v0, v3}, Lcom/android/launcher3/n0;->J(Lcom/android/launcher3/n0$a;)V

    .line 23
    .line 24
    .line 25
    move v0, v1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v0, v2

    .line 28
    :goto_0
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 29
    .line 30
    iput-boolean v2, v3, Lcom/android/launcher3/n0$a;->k:Z

    .line 31
    .line 32
    iput-boolean v1, v3, Lcom/android/launcher3/n0$a;->j:Z

    .line 33
    .line 34
    iput-boolean v1, v3, Lcom/android/launcher3/n0$a;->e:Z

    .line 35
    .line 36
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 37
    .line 38
    instance-of v4, v3, Lcom/android/launcher3/C2;

    .line 39
    .line 40
    if-eqz v4, :cond_1

    .line 41
    .line 42
    check-cast v3, Lcom/android/launcher3/C2;

    .line 43
    .line 44
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v3}, Lcom/android/launcher3/G4;->f()V

    .line 49
    .line 50
    .line 51
    :cond_1
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 52
    .line 53
    iget-object v3, v3, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 54
    .line 55
    if-eqz v3, :cond_2

    .line 56
    .line 57
    iget v3, v3, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 58
    .line 59
    const/4 v4, 0x4

    .line 60
    if-ne v3, v4, :cond_2

    .line 61
    .line 62
    move v3, v1

    .line 63
    goto :goto_1

    .line 64
    :cond_2
    move v3, v2

    .line 65
    :goto_1
    iget-boolean v4, p0, Lcom/android/launcher3/dragndrop/j;->u:Z

    .line 66
    .line 67
    if-eqz v4, :cond_3

    .line 68
    .line 69
    if-eqz v3, :cond_4

    .line 70
    .line 71
    :cond_3
    const/4 v3, 0x0

    .line 72
    invoke-direct {p0, v3, v2}, Lcom/android/launcher3/dragndrop/j;->o(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    :cond_4
    move v2, v0

    .line 76
    :cond_5
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->r()V

    .line 77
    .line 78
    .line 79
    if-eqz v2, :cond_6

    .line 80
    .line 81
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 82
    .line 83
    instance-of v0, p0, Lcom/android/launcher3/C2;

    .line 84
    .line 85
    if-eqz v0, :cond_6

    .line 86
    .line 87
    check-cast p0, Lcom/android/launcher3/C2;

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0, v1}, Lcom/android/launcher3/Workspace;->F2(Z)V

    .line 94
    .line 95
    .line 96
    :cond_6
    return-void
.end method

.method public n([I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v0, p1, v0

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    aget p1, p1, v1

    .line 6
    .line 7
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/dragndrop/j;->m(II)Lcom/android/launcher3/n0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p1}, Lcom/android/launcher3/n0;->c()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/dragndrop/j;->q(Lcom/android/launcher3/n0;Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->r()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-boolean v0, v0, Lcom/android/launcher3/dragndrop/p;->a:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/dragndrop/j;->D(Landroid/view/MotionEvent;)F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0, p1}, Lcom/android/launcher3/dragndrop/j;->E(Landroid/view/MotionEvent;)F

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {p0, v0, v2}, Lcom/android/launcher3/dragndrop/j;->w(FF)Landroid/graphics/Point;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/j;->m:Landroid/graphics/Point;

    .line 24
    .line 25
    iget v3, v0, Landroid/graphics/Point;->x:I

    .line 26
    .line 27
    iget v4, v0, Landroid/graphics/Point;->y:I

    .line 28
    .line 29
    invoke-virtual {v2, v3, v4}, Landroid/graphics/Point;->set(II)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_1

    .line 37
    .line 38
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/j;->l:Landroid/graphics/Point;

    .line 39
    .line 40
    iget v3, v0, Landroid/graphics/Point;->x:I

    .line 41
    .line 42
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 43
    .line 44
    invoke-virtual {v2, v3, v0}, Landroid/graphics/Point;->set(II)V

    .line 45
    .line 46
    .line 47
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getClassification()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iput v0, p0, Lcom/android/launcher3/dragndrop/j;->s:I

    .line 52
    .line 53
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->j:Lcom/android/launcher3/dragndrop/k;

    .line 54
    .line 55
    if-eqz p0, :cond_2

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Lcom/android/launcher3/dragndrop/k;->c(Landroid/view/MotionEvent;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_2

    .line 62
    .line 63
    const/4 p0, 0x1

    .line 64
    return p0

    .line 65
    :cond_2
    return v1
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    instance-of v0, v0, Lcom/android/launcher3/C2;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_8

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->j:Lcom/android/launcher3/dragndrop/k;

    .line 10
    .line 11
    if-eqz v0, :cond_7

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 14
    .line 15
    if-eqz v0, :cond_7

    .line 16
    .line 17
    iget-boolean v0, v0, Lcom/android/launcher3/dragndrop/p;->a:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto/16 :goto_1

    .line 22
    .line 23
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    invoke-virtual {p0, v3, v4}, Lcom/android/launcher3/dragndrop/j;->w(FF)Landroid/graphics/Point;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    and-int/lit16 v0, v0, 0xff

    .line 40
    .line 41
    if-eqz v0, :cond_5

    .line 42
    .line 43
    const/4 v3, 0x2

    .line 44
    if-eq v0, v3, :cond_3

    .line 45
    .line 46
    const/4 v1, 0x5

    .line 47
    if-eq v0, v1, :cond_2

    .line 48
    .line 49
    const/4 v1, 0x6

    .line 50
    if-eq v0, v1, :cond_1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 54
    .line 55
    check-cast v0, Lcom/android/launcher3/C2;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0, p1}, Lcom/android/launcher3/Workspace;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 62
    .line 63
    .line 64
    iput-boolean v2, p0, Lcom/android/launcher3/dragndrop/j;->w:Z

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 68
    .line 69
    check-cast v0, Lcom/android/launcher3/C2;

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0, p1}, Lcom/android/launcher3/Workspace;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 76
    .line 77
    .line 78
    iput-boolean v2, p0, Lcom/android/launcher3/dragndrop/j;->w:Z

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-le v0, v1, :cond_6

    .line 86
    .line 87
    iget-boolean v0, p0, Lcom/android/launcher3/dragndrop/j;->w:Z

    .line 88
    .line 89
    if-nez v0, :cond_4

    .line 90
    .line 91
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 92
    .line 93
    check-cast v0, Lcom/android/launcher3/C2;

    .line 94
    .line 95
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0, p1}, Lcom/android/launcher3/Workspace;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    iput-boolean v0, p0, Lcom/android/launcher3/dragndrop/j;->w:Z

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 107
    .line 108
    check-cast v0, Lcom/android/launcher3/C2;

    .line 109
    .line 110
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v0, p1}, Lcom/android/launcher3/Workspace;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->l:Landroid/graphics/Point;

    .line 119
    .line 120
    iget v1, v3, Landroid/graphics/Point;->x:I

    .line 121
    .line 122
    iget v2, v3, Landroid/graphics/Point;->y:I

    .line 123
    .line 124
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Point;->set(II)V

    .line 125
    .line 126
    .line 127
    :cond_6
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->j:Lcom/android/launcher3/dragndrop/k;

    .line 128
    .line 129
    invoke-virtual {p0, p1}, Lcom/android/launcher3/dragndrop/k;->d(Landroid/view/MotionEvent;)Z

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    return p0

    .line 134
    :cond_7
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 137
    .line 138
    .line 139
    const-string v0, "onControllerTouchEvent: drag driver: "

    .line 140
    .line 141
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->j:Lcom/android/launcher3/dragndrop/k;

    .line 145
    .line 146
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    const-string v0, ", options: "

    .line 150
    .line 151
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 155
    .line 156
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    const-string p1, "DragController"

    .line 164
    .line 165
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    .line 167
    .line 168
    return v2

    .line 169
    :cond_8
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->j:Lcom/android/launcher3/dragndrop/k;

    .line 170
    .line 171
    if-eqz p0, :cond_9

    .line 172
    .line 173
    invoke-virtual {p0, p1}, Lcom/android/launcher3/dragndrop/k;->d(Landroid/view/MotionEvent;)Z

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    if-eqz p0, :cond_9

    .line 178
    .line 179
    return v1

    .line 180
    :cond_9
    return v2
.end method

.method public p(Landroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->j:Lcom/android/launcher3/dragndrop/k;

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

.method protected q(Lcom/android/launcher3/n0;Ljava/lang/Runnable;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->r:Lcom/android/launcher3/n0;

    .line 2
    .line 3
    if-eq p1, v0, :cond_1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 8
    .line 9
    invoke-interface {v0, v1}, Lcom/android/launcher3/n0;->J(Lcom/android/launcher3/n0$a;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/j;->r:Lcom/android/launcher3/n0;

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 17
    .line 18
    invoke-interface {p1, v0}, Lcom/android/launcher3/n0;->l(Lcom/android/launcher3/n0$a;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    iput-boolean v1, v0, Lcom/android/launcher3/n0$a;->e:Z

    .line 25
    .line 26
    iget-object v2, v0, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 27
    .line 28
    iget v2, v2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 29
    .line 30
    const/4 v3, 0x4

    .line 31
    const/4 v4, 0x0

    .line 32
    if-eq v2, v3, :cond_3

    .line 33
    .line 34
    const/4 v3, 0x5

    .line 35
    if-ne v2, v3, :cond_2

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    move v2, v4

    .line 39
    goto :goto_1

    .line 40
    :cond_3
    :goto_0
    move v2, v1

    .line 41
    :goto_1
    iget-object v0, v0, Lcom/android/launcher3/n0$a;->m:Lcom/android/launcher3/dragndrop/y;

    .line 42
    .line 43
    instance-of v0, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 44
    .line 45
    iget-boolean v3, p0, Lcom/android/launcher3/dragndrop/j;->u:Z

    .line 46
    .line 47
    if-eqz v3, :cond_5

    .line 48
    .line 49
    if-nez v2, :cond_5

    .line 50
    .line 51
    if-nez v0, :cond_5

    .line 52
    .line 53
    invoke-static {}, Lcom/android/launcher3/y0;->A0()Z

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-eqz v3, :cond_4

    .line 58
    .line 59
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 60
    .line 61
    iput-boolean v1, v3, Lcom/android/launcher3/n0$a;->j:Z

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_4
    if-eqz p1, :cond_a

    .line 65
    .line 66
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 67
    .line 68
    invoke-interface {p1, p0}, Lcom/android/launcher3/n0;->J(Lcom/android/launcher3/n0$a;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_5
    :goto_2
    if-eqz p1, :cond_a

    .line 73
    .line 74
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 75
    .line 76
    invoke-interface {p1, v3}, Lcom/android/launcher3/n0;->J(Lcom/android/launcher3/n0$a;)V

    .line 77
    .line 78
    .line 79
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 80
    .line 81
    invoke-interface {p1, v3}, Lcom/android/launcher3/n0;->I(Lcom/android/launcher3/n0$a;)Z

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    if-eqz v3, :cond_8

    .line 86
    .line 87
    if-eqz p2, :cond_6

    .line 88
    .line 89
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 90
    .line 91
    .line 92
    goto :goto_3

    .line 93
    :cond_6
    iget-boolean p2, p0, Lcom/android/launcher3/dragndrop/j;->u:Z

    .line 94
    .line 95
    if-eqz p2, :cond_7

    .line 96
    .line 97
    if-nez v2, :cond_7

    .line 98
    .line 99
    if-eqz v0, :cond_9

    .line 100
    .line 101
    :cond_7
    iget-object p2, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 102
    .line 103
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 104
    .line 105
    invoke-interface {p1, p2, v0}, Lcom/android/launcher3/n0;->z(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V

    .line 106
    .line 107
    .line 108
    new-instance p2, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    .line 112
    .line 113
    const-string v0, "drop--onDrop--acceptDrop--dropTarget: "

    .line 114
    .line 115
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    const-string v0, "DragController"

    .line 130
    .line 131
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_8
    move v1, v4

    .line 136
    :cond_9
    :goto_3
    invoke-interface {p1}, Lcom/android/launcher3/n0;->getDropView()Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-direct {p0, p1, v1}, Lcom/android/launcher3/dragndrop/j;->o(Landroid/view/View;Z)V

    .line 141
    .line 142
    .line 143
    :cond_a
    return-void
.end method

.method protected r()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "DragController"

    .line 6
    .line 7
    if-eqz v0, :cond_5

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/j;->j:Lcom/android/launcher3/dragndrop/k;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 13
    .line 14
    iget-object v3, v2, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    if-eqz v3, :cond_3

    .line 18
    .line 19
    iget-boolean v2, v2, Lcom/android/launcher3/n0$a;->k:Z

    .line 20
    .line 21
    new-instance v3, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v5, "endDrag isDeferred : "

    .line 27
    .line 28
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v5, " mIsInPreDrag : "

    .line 35
    .line 36
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    iget-boolean v5, p0, Lcom/android/launcher3/dragndrop/j;->u:Z

    .line 40
    .line 41
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    if-nez v2, :cond_0

    .line 52
    .line 53
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 54
    .line 55
    iget-object v3, v3, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 56
    .line 57
    invoke-virtual {v3}, Lcom/android/launcher3/dragndrop/v;->D()V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    iget-boolean v3, p0, Lcom/android/launcher3/dragndrop/j;->u:Z

    .line 62
    .line 63
    if-eqz v3, :cond_1

    .line 64
    .line 65
    const/4 v3, -0x1

    .line 66
    invoke-virtual {p0, v0, v0, v3}, Lcom/android/launcher3/dragndrop/j;->i(Ljava/lang/Runnable;Landroid/view/View;I)V

    .line 67
    .line 68
    .line 69
    sget-object v3, Lf1/a;->x:Lf1/a$a;

    .line 70
    .line 71
    invoke-virtual {v3}, Lf1/a$a;->c()Z

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    if-eqz v3, :cond_1

    .line 76
    .line 77
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 78
    .line 79
    iget-object v3, v3, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 80
    .line 81
    invoke-static {v3}, Lp1/f;->u(Lcom/android/launcher3/model/data/y;)Z

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    if-eqz v3, :cond_1

    .line 86
    .line 87
    const-string v3, "endDrag, is hot seat icon"

    .line 88
    .line 89
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 93
    .line 94
    instance-of v5, v3, Lcom/android/launcher3/C2;

    .line 95
    .line 96
    if-eqz v5, :cond_1

    .line 97
    .line 98
    check-cast v3, Lcom/android/launcher3/C2;

    .line 99
    .line 100
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-virtual {v3}, Lcom/android/launcher3/Workspace;->getHotseatDivideAnimation()Lp1/a;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    iget-object v5, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 109
    .line 110
    const/4 v6, 0x1

    .line 111
    invoke-virtual {v3, v5, v6}, Lp1/a;->g(Lcom/android/launcher3/n0$a;Z)V

    .line 112
    .line 113
    .line 114
    :cond_1
    :goto_0
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 115
    .line 116
    instance-of v5, v3, Lcom/android/launcher3/C2;

    .line 117
    .line 118
    if-eqz v5, :cond_2

    .line 119
    .line 120
    check-cast v3, Lcom/android/launcher3/C2;

    .line 121
    .line 122
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-virtual {v3}, Lcom/android/launcher3/G4;->q()Z

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    if-nez v3, :cond_4

    .line 131
    .line 132
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 133
    .line 134
    iget-object v3, v3, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 135
    .line 136
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->clearAnimation()V

    .line 137
    .line 138
    .line 139
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 140
    .line 141
    iput-object v0, v3, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_2
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 145
    .line 146
    iget-object v3, v3, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 147
    .line 148
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->clearAnimation()V

    .line 149
    .line 150
    .line 151
    iget-object v3, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 152
    .line 153
    iput-object v0, v3, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_3
    move v2, v4

    .line 157
    :cond_4
    :goto_1
    if-nez v2, :cond_5

    .line 158
    .line 159
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->j()V

    .line 160
    .line 161
    .line 162
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 163
    .line 164
    instance-of v0, p0, Lcom/android/launcher3/C2;

    .line 165
    .line 166
    if-eqz v0, :cond_5

    .line 167
    .line 168
    check-cast p0, Lcom/android/launcher3/C2;

    .line 169
    .line 170
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-virtual {p0, v4}, Lcom/android/launcher3/G4;->g(Z)V

    .line 175
    .line 176
    .line 177
    :cond_5
    const-string p0, "endDrag"

    .line 178
    .line 179
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    .line 181
    .line 182
    return-void
.end method

.method protected s()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected abstract t()V
.end method

.method public v()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->m:Landroid/graphics/Point;

    .line 2
    .line 3
    iget v1, v0, Landroid/graphics/Point;->x:I

    .line 4
    .line 5
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 6
    .line 7
    invoke-direct {p0, v1, v0}, Lcom/android/launcher3/dragndrop/j;->m(II)Lcom/android/launcher3/n0;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method protected w(FF)Landroid/graphics/Point;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/j;->h:Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->getLocalVisibleRect(Landroid/graphics/Rect;)Z

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->n:Landroid/graphics/Point;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/j;->h:Landroid/graphics/Rect;

    .line 15
    .line 16
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 17
    .line 18
    int-to-float v2, v2

    .line 19
    iget v1, v1, Landroid/graphics/Rect;->right:I

    .line 20
    .line 21
    add-int/lit8 v1, v1, -0x1

    .line 22
    .line 23
    int-to-float v1, v1

    .line 24
    invoke-static {p1, v1}, Ljava/lang/Math;->min(FF)F

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-static {v2, p1}, Ljava/lang/Math;->max(FF)F

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    float-to-int p1, p1

    .line 33
    iput p1, v0, Landroid/graphics/Point;->x:I

    .line 34
    .line 35
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/j;->n:Landroid/graphics/Point;

    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->h:Landroid/graphics/Rect;

    .line 38
    .line 39
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 40
    .line 41
    int-to-float v1, v1

    .line 42
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 43
    .line 44
    add-int/lit8 v0, v0, -0x1

    .line 45
    .line 46
    int-to-float v0, v0

    .line 47
    invoke-static {p2, v0}, Ljava/lang/Math;->min(FF)F

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    invoke-static {v1, p2}, Ljava/lang/Math;->max(FF)F

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    float-to-int p2, p2

    .line 56
    iput p2, p1, Landroid/graphics/Point;->y:I

    .line 57
    .line 58
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->n:Landroid/graphics/Point;

    .line 59
    .line 60
    return-object p0
.end method

.method protected abstract x([I)Lcom/android/launcher3/n0;
.end method

.method public y()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/dragndrop/j;->t:I

    .line 2
    .line 3
    int-to-float p0, p0

    .line 4
    return p0
.end method

.method public z()Lcom/android/launcher3/n0$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 2
    .line 3
    return-object p0
.end method
