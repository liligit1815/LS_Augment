.class public final synthetic Lp2/e;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:LI1/e$b;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;LI1/e$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lp2/e;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lp2/e;->b:LI1/e$b;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lp2/e;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lp2/e;->b:LI1/e$b;

    .line 4
    .line 5
    check-cast p1, Lz1/Z4;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/widget/picker/search/a;->c(Ljava/lang/String;LI1/e$b;Lz1/Z4;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
