.class public final synthetic Ls1/L;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Ls1/P$a;


# direct methods
.method public synthetic constructor <init>(Ls1/P$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ls1/L;->a:Ls1/P$a;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/L;->a:Ls1/P$a;

    .line 2
    .line 3
    check-cast p1, Lcom/android/launcher3/model/data/z;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ls1/P$a;->i(Lcom/android/launcher3/model/data/z;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
