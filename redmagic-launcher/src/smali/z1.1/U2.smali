.class public final synthetic Lz1/U2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lz1/y0$b;

.field public final synthetic h:Ljava/util/function/Predicate;


# direct methods
.method public synthetic constructor <init>(Lz1/y0$b;Ljava/util/function/Predicate;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/U2;->g:Lz1/y0$b;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/U2;->h:Ljava/util/function/Predicate;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/U2;->g:Lz1/y0$b;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/U2;->h:Ljava/util/function/Predicate;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lz1/o3;->l(Lz1/y0$b;Ljava/util/function/Predicate;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
