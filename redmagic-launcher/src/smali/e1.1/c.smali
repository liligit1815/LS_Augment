.class public final synthetic Le1/c;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Le1/f;

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:Lz1/o3;


# direct methods
.method public synthetic constructor <init>(Le1/f;Ljava/lang/String;Lz1/o3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Le1/c;->g:Le1/f;

    .line 5
    .line 6
    iput-object p2, p0, Le1/c;->h:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Le1/c;->i:Lz1/o3;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Le1/c;->g:Le1/f;

    .line 2
    .line 3
    iget-object v1, p0, Le1/c;->h:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Le1/c;->i:Lz1/o3;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Le1/f;->c(Le1/f;Ljava/lang/String;Lz1/o3;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
