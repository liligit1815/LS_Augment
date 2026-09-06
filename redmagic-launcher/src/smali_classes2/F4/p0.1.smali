.class final LF4/p0;
.super Ljava/lang/Object;
.source "JobSupport.kt"

# interfaces
.implements LF4/q0;


# instance fields
.field private final g:LF4/F0;


# direct methods
.method public constructor <init>(LF4/F0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LF4/p0;->g:LF4/F0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getList()LF4/F0;
    .locals 0

    .line 1
    iget-object p0, p0, LF4/p0;->g:LF4/F0;

    .line 2
    .line 3
    return-object p0
.end method

.method public isActive()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
