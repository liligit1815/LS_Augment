.class Lcom/android/launcher3/dragndrop/I$a;
.super Ljava/lang/Object;
.source "LauncherDragController.java"

# interfaces
.implements Lcom/android/launcher3/dragndrop/p$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/dragndrop/I;->P(Landroid/graphics/drawable/Drawable;Landroid/view/View;Lcom/android/launcher3/dragndrop/y;IILcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Landroid/graphics/Rect;FFLcom/android/launcher3/dragndrop/p;)Lcom/android/launcher3/dragndrop/v;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/android/launcher3/dragndrop/I;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/dragndrop/I$a;->g:Landroid/view/View;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(D)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public b(Lcom/android/launcher3/n0$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/I$a;->g:Landroid/view/View;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public c(Lcom/android/launcher3/n0$a;Z)V
    .locals 0

    .line 1
    return-void
.end method
