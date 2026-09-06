.class public final Lz1/z1;
.super Ljava/lang/Object;
.source "LoaderCursor_Factory.java"


# instance fields
.field private final a:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Ls1/P;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/F1;",
            ">;"
        }
    .end annotation
.end field

.field private final d:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/D3;",
            ">;"
        }
    .end annotation
.end field

.field private final e:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/util/J1;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Ls1/P;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/F1;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/D3;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/J1;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/z1;->a:Lg4/a;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/z1;->b:Lg4/a;

    .line 7
    .line 8
    iput-object p3, p0, Lz1/z1;->c:Lg4/a;

    .line 9
    .line 10
    iput-object p4, p0, Lz1/z1;->d:Lg4/a;

    .line 11
    .line 12
    iput-object p5, p0, Lz1/z1;->e:Lg4/a;

    .line 13
    .line 14
    return-void
.end method

.method public static a(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)Lz1/z1;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Ls1/P;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/F1;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/D3;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/J1;",
            ">;)",
            "Lz1/z1;"
        }
    .end annotation

    .line 1
    new-instance v0, Lz1/z1;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Lz1/z1;-><init>(Lg4/a;Lg4/a;Lg4/a;Lg4/a;Lg4/a;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static c(Landroid/database/Cursor;Lz1/L4;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;Landroid/content/Context;Ls1/P;Lcom/android/launcher3/F1;Lcom/android/launcher3/D3;Lcom/android/launcher3/util/J1;)Lz1/y1;
    .locals 9

    .line 1
    new-instance v0, Lz1/y1;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    move-object v6, p5

    .line 9
    move-object v7, p6

    .line 10
    move-object/from16 v8, p7

    .line 11
    .line 12
    invoke-direct/range {v0 .. v8}, Lz1/y1;-><init>(Landroid/database/Cursor;Lz1/L4;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;Landroid/content/Context;Ls1/P;Lcom/android/launcher3/F1;Lcom/android/launcher3/D3;Lcom/android/launcher3/util/J1;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method


# virtual methods
.method public b(Landroid/database/Cursor;Lz1/L4;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;)Lz1/y1;
    .locals 9

    .line 1
    iget-object v0, p0, Lz1/z1;->a:Lg4/a;

    .line 2
    .line 3
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v4, v0

    .line 8
    check-cast v4, Landroid/content/Context;

    .line 9
    .line 10
    iget-object v0, p0, Lz1/z1;->b:Lg4/a;

    .line 11
    .line 12
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    move-object v5, v0

    .line 17
    check-cast v5, Ls1/P;

    .line 18
    .line 19
    iget-object v0, p0, Lz1/z1;->c:Lg4/a;

    .line 20
    .line 21
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    move-object v6, v0

    .line 26
    check-cast v6, Lcom/android/launcher3/F1;

    .line 27
    .line 28
    iget-object v0, p0, Lz1/z1;->d:Lg4/a;

    .line 29
    .line 30
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    move-object v7, v0

    .line 35
    check-cast v7, Lcom/android/launcher3/D3;

    .line 36
    .line 37
    iget-object p0, p0, Lz1/z1;->e:Lg4/a;

    .line 38
    .line 39
    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    move-object v8, p0

    .line 44
    check-cast v8, Lcom/android/launcher3/util/J1;

    .line 45
    .line 46
    move-object v1, p1

    .line 47
    move-object v2, p2

    .line 48
    move-object v3, p3

    .line 49
    invoke-static/range {v1 .. v8}, Lz1/z1;->c(Landroid/database/Cursor;Lz1/L4;Lcom/android/launcher3/backuprestore/LauncherRestoreEventLogger;Landroid/content/Context;Ls1/P;Lcom/android/launcher3/F1;Lcom/android/launcher3/D3;Lcom/android/launcher3/util/J1;)Lz1/y1;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0
.end method
