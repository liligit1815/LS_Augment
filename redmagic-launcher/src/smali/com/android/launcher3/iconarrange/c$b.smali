.class Lcom/android/launcher3/iconarrange/c$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "IconArrangePreviewItemAnim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/iconarrange/c;-><init>(Lcom/android/launcher3/C2;ILcom/android/launcher3/folder/Folder;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;Lcom/android/launcher3/iconarrange/b;IIIIFFI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/folder/Folder;

.field final synthetic h:Lcom/android/launcher3/model/data/y;

.field final synthetic i:Lcom/android/launcher3/C2;

.field final synthetic j:Lcom/android/launcher3/n0$a;

.field final synthetic k:I

.field final synthetic l:Lcom/android/launcher3/iconarrange/c;


# direct methods
.method constructor <init>(Lcom/android/launcher3/iconarrange/c;Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/C2;Lcom/android/launcher3/n0$a;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/iconarrange/c$b;->l:Lcom/android/launcher3/iconarrange/c;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/iconarrange/c$b;->g:Lcom/android/launcher3/folder/Folder;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/iconarrange/c$b;->h:Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/iconarrange/c$b;->i:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/iconarrange/c$b;->j:Lcom/android/launcher3/n0$a;

    .line 10
    .line 11
    iput p6, p0, Lcom/android/launcher3/iconarrange/c$b;->k:I

    .line 12
    .line 13
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/c$b;->l:Lcom/android/launcher3/iconarrange/c;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/iconarrange/c;->a(Lcom/android/launcher3/iconarrange/c;)Lcom/android/launcher3/iconarrange/b;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p1, v0}, Lcom/android/launcher3/iconarrange/b;->f(Lcom/android/launcher3/iconarrange/c;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/c$b;->g:Lcom/android/launcher3/folder/Folder;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/c$b;->h:Lcom/android/launcher3/model/data/y;

    .line 17
    .line 18
    invoke-virtual {p1, v1}, Lcom/android/launcher3/folder/Folder;->D0(Lcom/android/launcher3/model/data/y;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/c$b;->h:Lcom/android/launcher3/model/data/y;

    .line 28
    .line 29
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/c$b;->i:Lcom/android/launcher3/C2;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/c$b;->h:Lcom/android/launcher3/model/data/y;

    .line 39
    .line 40
    iget v2, v2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 41
    .line 42
    const/16 v3, -0x64

    .line 43
    .line 44
    invoke-virtual {v1, p1, v3, v2}, Lz1/J3;->U(Ljava/util/ArrayList;II)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/c$b;->i:Lcom/android/launcher3/C2;

    .line 48
    .line 49
    invoke-virtual {v1, p1, v0}, Lcom/android/launcher3/C2;->L(Ljava/util/List;Z)V

    .line 50
    .line 51
    .line 52
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/c$b;->j:Lcom/android/launcher3/n0$a;

    .line 53
    .line 54
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 55
    .line 56
    iget-object p1, p1, Lcom/android/launcher3/dragndrop/v;->R:Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    add-int/lit8 p1, p1, -0x1

    .line 63
    .line 64
    iget v1, p0, Lcom/android/launcher3/iconarrange/c$b;->k:I

    .line 65
    .line 66
    if-ne p1, v1, :cond_1

    .line 67
    .line 68
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/c$b;->i:Lcom/android/launcher3/C2;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/c$b;->j:Lcom/android/launcher3/n0$a;

    .line 75
    .line 76
    iget-object v1, v1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 77
    .line 78
    invoke-virtual {p1, v1}, Lcom/android/launcher3/dragndrop/j;->L(Lcom/android/launcher3/dragndrop/v;)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/c$b;->i:Lcom/android/launcher3/C2;

    .line 82
    .line 83
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->invalidate()V

    .line 88
    .line 89
    .line 90
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/c$b;->i:Lcom/android/launcher3/C2;

    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p0, v0}, Lcom/android/launcher3/menu/c;->z(Z)V

    .line 97
    .line 98
    .line 99
    :cond_1
    return-void
.end method
