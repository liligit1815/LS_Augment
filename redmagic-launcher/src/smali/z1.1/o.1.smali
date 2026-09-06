.class public final synthetic Lz1/o;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic a:LD1/t;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(LD1/t;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/o;->a:LD1/t;

    .line 5
    .line 6
    iput p2, p0, Lz1/o;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/o;->a:LD1/t;

    .line 2
    .line 3
    iget p0, p0, Lz1/o;->b:I

    .line 4
    .line 5
    check-cast p1, Landroid/os/UserHandle;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lz1/q;->a(LD1/t;ILandroid/os/UserHandle;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
