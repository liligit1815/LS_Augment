.class public final synthetic Lcom/android/launcher3/util/Q1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/LongFunction;


# instance fields
.field public final synthetic a:LD1/t;


# direct methods
.method public synthetic constructor <init>(LD1/t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/util/Q1;->a:LD1/t;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final apply(J)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/Q1;->a:LD1/t;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, LD1/t;->n(J)Landroid/os/UserHandle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
