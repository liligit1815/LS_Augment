.class public final synthetic Lcom/android/launcher3/folder/g;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/folder/Folder;

.field public final synthetic b:Landroid/animation/AnimatorSet;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/folder/Folder;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/folder/g;->a:Lcom/android/launcher3/folder/Folder;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/folder/g;->b:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/g;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/folder/g;->b:Landroid/animation/AnimatorSet;

    .line 4
    .line 5
    check-cast p1, Landroid/view/View;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/folder/Folder;->O(Lcom/android/launcher3/folder/Folder;Landroid/animation/AnimatorSet;Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
