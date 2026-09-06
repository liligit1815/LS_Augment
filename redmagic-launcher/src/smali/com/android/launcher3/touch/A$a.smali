.class Lcom/android/launcher3/touch/A$a;
.super Ljava/lang/Object;
.source "ItemLongClickListener.java"

# interfaces
.implements Lcom/android/launcher3/dragndrop/j$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/touch/A;->e(Landroid/view/View;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/view/View;

.field final synthetic h:Lcom/android/launcher3/dragndrop/j;


# direct methods
.method constructor <init>(Landroid/view/View;Lcom/android/launcher3/dragndrop/j;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/touch/A$a;->g:Landroid/view/View;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/touch/A$a;->h:Lcom/android/launcher3/dragndrop/j;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/touch/A$a;->g:Landroid/view/View;

    .line 2
    .line 3
    const/4 p1, 0x4

    .line 4
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public v()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/A$a;->g:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/touch/A$a;->h:Lcom/android/launcher3/dragndrop/j;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/android/launcher3/dragndrop/j;->N(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
