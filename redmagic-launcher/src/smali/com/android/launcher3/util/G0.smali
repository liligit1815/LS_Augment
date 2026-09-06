.class public final synthetic Lcom/android/launcher3/util/G0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic a:Landroid/os/UserHandle;

.field public final synthetic b:Ljava/util/HashSet;


# direct methods
.method public synthetic constructor <init>(Landroid/os/UserHandle;Ljava/util/HashSet;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/util/G0;->a:Landroid/os/UserHandle;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/util/G0;->b:Ljava/util/HashSet;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/G0;->a:Landroid/os/UserHandle;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/util/G0;->b:Ljava/util/HashSet;

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/util/P0;->b(Landroid/os/UserHandle;Ljava/util/HashSet;Lcom/android/launcher3/model/data/y;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
