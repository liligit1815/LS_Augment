.class Lcom/android/launcher3/folder/u0$b;
.super Ljava/lang/Object;
.source "PreviewBackground.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/u0;->o0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;IIZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

.field final synthetic h:Lcom/android/launcher3/CellLayout;

.field final synthetic i:Lcom/android/launcher3/folder/u0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/u0;Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;Lcom/android/launcher3/CellLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/u0$b;->i:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/folder/u0$b;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/folder/u0$b;->h:Lcom/android/launcher3/CellLayout;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$b;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$b;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$b;->i:Lcom/android/launcher3/folder/u0;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/folder/u0$b;->h:Lcom/android/launcher3/CellLayout;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$b;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 26
    .line 27
    iget v2, p0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 28
    .line 29
    iget p0, p0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 30
    .line 31
    invoke-static {v0, v1, v2, p0}, Lcom/android/launcher3/folder/u0;->S(Lcom/android/launcher3/folder/u0;Lcom/android/launcher3/CellLayout;II)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
