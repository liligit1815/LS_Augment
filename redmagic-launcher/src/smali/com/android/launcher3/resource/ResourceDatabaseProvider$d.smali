.class Lcom/android/launcher3/resource/ResourceDatabaseProvider$d;
.super Ljava/lang/Object;
.source "ResourceDatabaseProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/resource/ResourceDatabaseProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "d"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:I

.field public c:J

.field public d:J

.field public e:I

.field public f:I

.field public g:Landroid/content/Intent;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:I

.field public l:I

.field public m:J

.field public n:J

.field public o:I

.field public p:Landroid/os/UserHandle;

.field public q:Landroid/content/Context;


# direct methods
.method public constructor <init>(Ljava/lang/String;IJJIILandroid/content/Intent;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJJILandroid/os/UserHandle;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/resource/ResourceDatabaseProvider$d;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/resource/ResourceDatabaseProvider$d;->b:I

    .line 7
    .line 8
    iput-wide p5, p0, Lcom/android/launcher3/resource/ResourceDatabaseProvider$d;->c:J

    .line 9
    .line 10
    iput-wide p3, p0, Lcom/android/launcher3/resource/ResourceDatabaseProvider$d;->d:J

    .line 11
    .line 12
    iput p7, p0, Lcom/android/launcher3/resource/ResourceDatabaseProvider$d;->e:I

    .line 13
    .line 14
    iput p8, p0, Lcom/android/launcher3/resource/ResourceDatabaseProvider$d;->f:I

    .line 15
    .line 16
    move-object/from16 p1, p21

    .line 17
    .line 18
    iput-object p1, p0, Lcom/android/launcher3/resource/ResourceDatabaseProvider$d;->q:Landroid/content/Context;

    .line 19
    .line 20
    iput-object p9, p0, Lcom/android/launcher3/resource/ResourceDatabaseProvider$d;->g:Landroid/content/Intent;

    .line 21
    .line 22
    iput-object p10, p0, Lcom/android/launcher3/resource/ResourceDatabaseProvider$d;->h:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p11, p0, Lcom/android/launcher3/resource/ResourceDatabaseProvider$d;->i:Ljava/lang/String;

    .line 25
    .line 26
    iput-object p12, p0, Lcom/android/launcher3/resource/ResourceDatabaseProvider$d;->j:Ljava/lang/String;

    .line 27
    .line 28
    iput p13, p0, Lcom/android/launcher3/resource/ResourceDatabaseProvider$d;->k:I

    .line 29
    .line 30
    iput p14, p0, Lcom/android/launcher3/resource/ResourceDatabaseProvider$d;->l:I

    .line 31
    .line 32
    move-wide/from16 p1, p17

    .line 33
    .line 34
    iput-wide p1, p0, Lcom/android/launcher3/resource/ResourceDatabaseProvider$d;->m:J

    .line 35
    .line 36
    move-wide p1, p15

    .line 37
    iput-wide p1, p0, Lcom/android/launcher3/resource/ResourceDatabaseProvider$d;->n:J

    .line 38
    .line 39
    move/from16 p1, p19

    .line 40
    .line 41
    iput p1, p0, Lcom/android/launcher3/resource/ResourceDatabaseProvider$d;->o:I

    .line 42
    .line 43
    move-object/from16 p1, p20

    .line 44
    .line 45
    iput-object p1, p0, Lcom/android/launcher3/resource/ResourceDatabaseProvider$d;->p:Landroid/os/UserHandle;

    .line 46
    .line 47
    return-void
.end method
