.class Lcom/android/launcher3/Workspace$k;
.super Ljava/lang/Object;
.source "Workspace.java"

# interfaces
.implements Lcom/android/launcher3/util/Y0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/Workspace;->L0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/Workspace;


# direct methods
.method constructor <init>(Lcom/android/launcher3/Workspace;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/Workspace$k;->a:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p1, p2, Lcom/android/launcher3/n0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/Workspace$k;->a:Lcom/android/launcher3/Workspace;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->y:Lcom/android/launcher3/dragndrop/j;

    .line 8
    .line 9
    check-cast p2, Lcom/android/launcher3/n0;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Lcom/android/launcher3/dragndrop/j;->O(Lcom/android/launcher3/n0;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method
