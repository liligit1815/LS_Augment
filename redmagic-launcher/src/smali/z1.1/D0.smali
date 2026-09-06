.class public final synthetic Lz1/D0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic a:Lz1/F0;


# direct methods
.method public synthetic constructor <init>(Lz1/F0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/D0;->a:Lz1/F0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/D0;->a:Lz1/F0;

    .line 2
    .line 3
    check-cast p1, Lcom/android/launcher3/model/data/A;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lz1/F0;->c(Lz1/F0;Lcom/android/launcher3/model/data/A;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
