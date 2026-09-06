.class public final synthetic LF4/A;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/p;


# instance fields
.field public final synthetic g:Lkotlin/jvm/internal/C;

.field public final synthetic h:Z


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/internal/C;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LF4/A;->g:Lkotlin/jvm/internal/C;

    .line 5
    .line 6
    iput-boolean p2, p0, LF4/A;->h:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, LF4/A;->g:Lkotlin/jvm/internal/C;

    .line 2
    .line 3
    iget-boolean p0, p0, LF4/A;->h:Z

    .line 4
    .line 5
    check-cast p1, Ll4/g;

    .line 6
    .line 7
    check-cast p2, Ll4/g$b;

    .line 8
    .line 9
    invoke-static {v0, p0, p1, p2}, LF4/C;->a(Lkotlin/jvm/internal/C;ZLl4/g;Ll4/g$b;)Ll4/g;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
