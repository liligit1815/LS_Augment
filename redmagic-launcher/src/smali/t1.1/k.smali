.class public final synthetic Lt1/k;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/l;


# instance fields
.field public final synthetic g:Lt1/n;


# direct methods
.method public synthetic constructor <init>(Lt1/n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lt1/k;->g:Lt1/n;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lt1/k;->g:Lt1/n;

    .line 2
    .line 3
    check-cast p1, Lt1/n$d;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lt1/n;->b(Lt1/n;Lt1/n$d;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
