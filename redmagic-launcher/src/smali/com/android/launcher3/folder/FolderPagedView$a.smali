.class Lcom/android/launcher3/folder/FolderPagedView$a;
.super Ljava/lang/Object;
.source "FolderPagedView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/FolderPagedView;->q0(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/view/View;

.field final synthetic h:F

.field final synthetic i:I

.field final synthetic j:Lcom/android/launcher3/folder/FolderPagedView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/FolderPagedView;Landroid/view/View;FI)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/FolderPagedView$a;->j:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/folder/FolderPagedView$a;->g:Landroid/view/View;

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/folder/FolderPagedView$a;->h:F

    .line 6
    .line 7
    iput p4, p0, Lcom/android/launcher3/folder/FolderPagedView$a;->i:I

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView$a;->j:Lcom/android/launcher3/folder/FolderPagedView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/folder/FolderPagedView;->l:Landroid/util/ArrayMap;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderPagedView$a;->g:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView$a;->g:Landroid/view/View;

    .line 11
    .line 12
    iget v1, p0, Lcom/android/launcher3/folder/FolderPagedView$a;->h:F

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView$a;->g:Landroid/view/View;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/android/launcher3/CellLayout;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderPagedView$a;->g:Landroid/view/View;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/android/launcher3/CellLayout;->removeView(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView$a;->j:Lcom/android/launcher3/folder/FolderPagedView;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderPagedView$a;->g:Landroid/view/View;

    .line 37
    .line 38
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Lcom/android/launcher3/model/data/I;

    .line 43
    .line 44
    iget p0, p0, Lcom/android/launcher3/folder/FolderPagedView$a;->i:I

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2, p0}, Lcom/android/launcher3/folder/FolderPagedView;->V(Landroid/view/View;Lcom/android/launcher3/model/data/y;I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method
