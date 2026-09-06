.class Lcom/google/android/material/bottomappbar/BottomAppBar$d;
.super Landroid/animation/AnimatorListenerAdapter;
.source "BottomAppBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/bottomappbar/BottomAppBar;->r0(IZLjava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field public g:Z

.field final synthetic h:Landroidx/appcompat/widget/ActionMenuView;

.field final synthetic i:I

.field final synthetic j:Z

.field final synthetic k:Lcom/google/android/material/bottomappbar/BottomAppBar;


# direct methods
.method constructor <init>(Lcom/google/android/material/bottomappbar/BottomAppBar;Landroidx/appcompat/widget/ActionMenuView;IZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$d;->k:Lcom/google/android/material/bottomappbar/BottomAppBar;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$d;->h:Landroidx/appcompat/widget/ActionMenuView;

    .line 4
    .line 5
    iput p3, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$d;->i:I

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$d;->j:Z

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$d;->g:Z

    .line 3
    .line 4
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-boolean p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$d;->g:Z

    .line 2
    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$d;->k:Lcom/google/android/material/bottomappbar/BottomAppBar;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0(Lcom/google/android/material/bottomappbar/BottomAppBar;)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p1, 0x0

    .line 16
    :goto_0
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$d;->k:Lcom/google/android/material/bottomappbar/BottomAppBar;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/google/android/material/bottomappbar/BottomAppBar;->a0(Lcom/google/android/material/bottomappbar/BottomAppBar;)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomappbar/BottomAppBar;->C0(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$d;->k:Lcom/google/android/material/bottomappbar/BottomAppBar;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$d;->h:Landroidx/appcompat/widget/ActionMenuView;

    .line 28
    .line 29
    iget v2, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$d;->i:I

    .line 30
    .line 31
    iget-boolean p0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$d;->j:Z

    .line 32
    .line 33
    invoke-static {v0, v1, v2, p0, p1}, Lcom/google/android/material/bottomappbar/BottomAppBar;->b0(Lcom/google/android/material/bottomappbar/BottomAppBar;Landroidx/appcompat/widget/ActionMenuView;IZZ)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method
