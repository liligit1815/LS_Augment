.class public final synthetic Lcom/android/launcher3/taskbar/W0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Supplier;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/taskbar/I1;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/I1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/W0;->a:Lcom/android/launcher3/taskbar/I1;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/W0;->a:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/I1;->l(Lcom/android/launcher3/taskbar/I1;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
