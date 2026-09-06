.class public final synthetic Lcom/android/launcher3/widget/picker/n;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic a:Lz1/L4;


# direct methods
.method public synthetic constructor <init>(Lz1/L4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/n;->a:Lz1/L4;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/picker/n;->a:Lz1/L4;

    .line 2
    .line 3
    check-cast p1, Landroid/os/UserHandle;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lz1/L4;->d(Landroid/os/UserHandle;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
