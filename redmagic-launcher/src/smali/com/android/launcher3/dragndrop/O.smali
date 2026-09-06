.class public final Lcom/android/launcher3/dragndrop/O;
.super Ljava/lang/Object;
.source "SpringLoadedDragController.kt"

# interfaces
.implements Lcom/android/launcher3/L4;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/dragndrop/O$a;
    }
.end annotation


# static fields
.field public static final j:Lcom/android/launcher3/dragndrop/O$a;


# instance fields
.field private final g:Lcom/android/launcher3/C2;

.field private final h:Lcom/android/launcher3/c;

.field private i:Lcom/android/launcher3/CellLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/dragndrop/O$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/dragndrop/O$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/dragndrop/O;->j:Lcom/android/launcher3/dragndrop/O$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 1

    .line 1
    const-string v0, "launcher"

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
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/O;->g:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    new-instance p1, Lcom/android/launcher3/c;

    .line 12
    .line 13
    invoke-direct {p1}, Lcom/android/launcher3/c;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p0}, Lcom/android/launcher3/c;->e(Lcom/android/launcher3/L4;)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/O;->h:Lcom/android/launcher3/c;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/c;)V
    .locals 3

    .line 1
    const-string v0, "alarm"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/O;->i:Lcom/android/launcher3/CellLayout;

    .line 7
    .line 8
    if-eqz p1, :cond_6

    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/dragndrop/O;->g:Lcom/android/launcher3/C2;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/O;->i:Lcom/android/launcher3/CellLayout;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Lcom/android/launcher3/V4;->isVisible(Landroid/view/View;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_5

    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/O;->g:Lcom/android/launcher3/C2;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget v0, v0, Lcom/android/launcher3/dragndrop/j;->t:I

    .line 31
    .line 32
    if-eqz v0, :cond_5

    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/O;->g:Lcom/android/launcher3/C2;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    const-string v1, "SpringLoadedDragController"

    .line 43
    .line 44
    const-string v2, "onAlarm: close folder when snap page."

    .line 45
    .line 46
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    const/4 v1, 0x0

    .line 50
    invoke-virtual {v0, v1}, Lcom/android/launcher3/a;->close(Z)V

    .line 51
    .line 52
    .line 53
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/O;->i:Lcom/android/launcher3/CellLayout;

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->isCircle()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_1

    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/lit8 v0, v0, -0x1

    .line 76
    .line 77
    if-ne p0, v0, :cond_1

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->getPanelCount()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    sub-int/2addr p0, v0

    .line 88
    goto :goto_0

    .line 89
    :cond_1
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    add-int/lit8 v1, v1, -0x1

    .line 98
    .line 99
    if-ne v0, v1, :cond_2

    .line 100
    .line 101
    if-nez p0, :cond_2

    .line 102
    .line 103
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    :cond_2
    :goto_0
    iget-boolean v0, p1, Lcom/android/launcher3/V4;->mIsRtl:Z

    .line 108
    .line 109
    if-eqz v0, :cond_4

    .line 110
    .line 111
    if-gez p0, :cond_3

    .line 112
    .line 113
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    goto :goto_1

    .line 118
    :cond_3
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-ne p0, v0, :cond_4

    .line 123
    .line 124
    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->getPanelCount()I

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    neg-int p0, p0

    .line 129
    :cond_4
    :goto_1
    invoke-virtual {p1, p0}, Lcom/android/launcher3/V4;->snapToPage(I)Z

    .line 130
    .line 131
    .line 132
    :cond_5
    return-void

    .line 133
    :cond_6
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/O;->g:Lcom/android/launcher3/C2;

    .line 134
    .line 135
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->l()V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public final b()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/O;->h:Lcom/android/launcher3/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/c;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/O;->h:Lcom/android/launcher3/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/c;->a()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final d(Lcom/android/launcher3/CellLayout;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/O;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/O;->h:Lcom/android/launcher3/c;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    const-wide/16 v1, 0x3b6

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    const-wide/16 v1, 0xbb8

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const-wide/16 v1, 0xfa

    .line 21
    .line 22
    :goto_0
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/c;->d(J)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/O;->i:Lcom/android/launcher3/CellLayout;

    .line 26
    .line 27
    return-void
.end method
