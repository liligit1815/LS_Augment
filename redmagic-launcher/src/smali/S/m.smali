.class public abstract LS/m;
.super Ljava/lang/RuntimeException;
.source "Violation.kt"


# instance fields
.field private final g:Landroidx/fragment/app/n;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/n;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "fragment"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, LS/m;->g:Landroidx/fragment/app/n;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a()Landroidx/fragment/app/n;
    .locals 0

    .line 1
    iget-object p0, p0, LS/m;->g:Landroidx/fragment/app/n;

    .line 2
    .line 3
    return-object p0
.end method
