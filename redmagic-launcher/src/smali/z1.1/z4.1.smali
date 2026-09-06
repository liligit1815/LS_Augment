.class public Lz1/z4;
.super Ljava/lang/Object;
.source "ReloadStringCacheTask.java"

# interfaces
.implements Lcom/android/launcher3/D3$d;


# instance fields
.field private a:Lz1/m2;


# direct methods
.method public constructor <init>(Lz1/m2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/z4;->a:Lz1/m2;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Lz1/G4;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Lz1/y0$b;->X(Lz1/G4;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 0

    .line 1
    monitor-enter p2

    .line 2
    :try_start_0
    iget-object p0, p0, Lz1/z4;->a:Lz1/m2;

    .line 3
    .line 4
    iget-object p3, p2, Lz1/y0;->e:Lz1/G4;

    .line 5
    .line 6
    invoke-virtual {p0, p3}, Lz1/m2;->h(Lz1/G4;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p2, Lz1/y0;->e:Lz1/G4;

    .line 10
    .line 11
    invoke-virtual {p0}, Lz1/G4;->c()Lz1/G4;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p3, Lz1/y4;

    .line 16
    .line 17
    invoke-direct {p3, p0}, Lz1/y4;-><init>(Lz1/G4;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p3}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 21
    .line 22
    .line 23
    monitor-exit p2

    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    throw p0
.end method
