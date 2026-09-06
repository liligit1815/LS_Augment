.class public final synthetic Ls1/N;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic a:Ls1/P;


# direct methods
.method public synthetic constructor <init>(Ls1/P;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ls1/N;->a:Ls1/P;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/N;->a:Ls1/P;

    .line 2
    .line 3
    check-cast p1, Lcom/android/launcher3/model/data/z;

    .line 4
    .line 5
    invoke-static {p0, p1}, Ls1/P;->p0(Ls1/P;Lcom/android/launcher3/model/data/z;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
