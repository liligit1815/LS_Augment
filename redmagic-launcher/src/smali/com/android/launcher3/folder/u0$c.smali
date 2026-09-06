.class Lcom/android/launcher3/folder/u0$c;
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

.field final synthetic h:Lcom/android/launcher3/folder/u0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/u0;Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/u0$c;->h:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/folder/u0$c;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$c;->h:Lcom/android/launcher3/folder/u0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/android/launcher3/folder/u0;->J(Lcom/android/launcher3/folder/u0;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$c;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$c;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/16 v1, 0xff

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$c;->h:Lcom/android/launcher3/folder/u0;

    .line 27
    .line 28
    invoke-static {p0}, Lcom/android/launcher3/folder/u0;->R(Lcom/android/launcher3/folder/u0;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
